require "net/http"
require "parallel"
#################################################################
def fetch(ok,u)
  url=URI.parse(u)
  begin
    bakcode=Net::HTTP.new(url.host).get(url.request_uri).code
    ok.push(u) if bakcode=="200"
  rescue;end
end
#################################################################
c,url,out=0,[],[]
(i=`dd`.split)   .each   { | id       |
['http','https'] .each   { | protocol |
['htm','html']   .each   { | sort     |
  url<<'%s://www.u.tsukuba.ac.jp/~%s/index.%s'%[protocol,id,sort]
}}}
#################################################################
puts('ID:%sXXXXX'%(n=i[0][0,3]))
puts('SIZE:%d'%url.size)
Parallel.map(url,in_threads: 10){|i|c+=1;print(c,?\r);fetch(out,i)}
puts('=>Finished!')
File.open('LIST_%s'%n,'w'){|f|out.each{|r|f.puts(r)}}
File.open('LIST_%s.md'%n,'w'){|f|
  out.each{|r|f.puts('[%s](%s)'%[r.scan(/s19\d{5}/)[0],r])}
}
