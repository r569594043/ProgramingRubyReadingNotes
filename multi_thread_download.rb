require "open-uri"

def download  
  if $*[0] == nil or $*[1] == nil or $*[2] == nil
    abort "用法示例：ruby #$0 开始数　结束数　存放的目录 EX:如ruby #$0 200 300 d:\\ "
  end
  time = Time.now
  threads = []
  for i in $*[0]..$*[1]
    exports = "http://blog.ntjy.net/my_blogs/" + i.to_s
    threads << Thread.new(i) do |thread|
      begin
        data = open(exports){|f|f.read}
        open("#{$*[2]}\\#{thread}.html","wb"){|f|f.write(data)}
        print thread, "-"
      rescue
      end
    end
  end
  threads.each {|thr| thr.join}
  puts " 下载完成，共耗时：#{Time.now - time}秒"
end