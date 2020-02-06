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
(i=`dd 2>/dev/null`.split)   .each   { | id       |
['http']         .each   { | protocol |
['htm','html']   .each   { | sort     |
  print id,"\r"
  url<<'%s://www.u.tsukuba.ac.jp/~%s/index.%s'%[protocol,id,sort]
}}}
#################################################################
nowdate=`LANG='en_EN' date +%y-%m-%d`.chomp
puts('ID:%sXXXXX'%(n=i[0][0,3]))
puts('SIZE:%d'%url.size)
Parallel.map(url,in_threads:30){|i|c+=1;print(c,?\r);fetch(out,i)}
puts('=>Finished!')
File.open('./LISTS/%s/LIST_%s'%[nowdate,n],'w'){|f|out.each{|r|f.puts(r)}}
File.open('./LISTS_MD/%s/LIST_%s.md'%[nowdate,n],'w'){|f|out.each{|r|f.puts('[%s](%s)  '%[r,r])}}
