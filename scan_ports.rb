﻿require 'socket'  
include Socket::Constants   
  
def scan_port   
  if $*[0] == nil or $*[1] == nil or $*[2] == nil  
    abort "用法示例：ruby #$0 ip地址 开始端口　结束端口 EX:如ruby #$0 localhost 1 1024"  
  end  
  time = Time.now   
  scan $*[0], $*[1], $*[2]   
  puts "\n共耗时：#{Time.now - time}秒"  
end  
  
private   
def scan(address, start_port, end_port)   
  threads = []   
  for port in start_port..end_port   
    threads << Thread.new(port) do |theport|   
      begin  
        socket = Socket.new(AF_INET, SOCK_STREAM, 0) #生成新的套接字   
        sockaddr = Socket.pack_sockaddr_in(theport, address)   
        socket.connect(sockaddr)   
        puts "Port:#{theport} is Opend!\n"  
        socket.close   
      rescue  
      end  
    end  
  end  
  threads.each {|thr| thr.join}   
end  