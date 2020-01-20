require "net/http"
require "parallel"
#################################################################
def fetch(ok,u)
  url=URI.parse(u)
  begin
    if Net::HTTP.new(url.host).get(url.request_uri).code != "404"
      ok.push(u)
    end
  rescue;end
end
#################################################################
c,url,out=0,[],[]
(i=`dd`.split)   .each   { | id       |
['http','https'] .each   { | protocol |
['htm','html']   .each   { | sort     |
  url<<"#{protocol}://www.u.tsukuba.ac.jp/~#{id}/index.#{sort}"
}}}
#################################################################
puts("size = #{url.size}")
puts(n=i[0][0,3])
Parallel.map(url,in_threads: 10){|i|c+=1;print(c,"\r");fetch(out,i)}
File.open('LIST_%s'%n,'w'){|f|out.each{|r|f.puts(r)}}
File.open('LIST_%s.md'%n,'w'){|f|
  out.each{|r|f.puts("[%s](%s)"%[r.scan(/s19\d{5}/)[0],r])}
}
