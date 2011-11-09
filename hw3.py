import urllib2
import time
var1=urllib2.build_opener()
begin_time = time.time()
var1.open('http://www.yahoo.com/')
end_time = time.time()
duration=end_time-begin_time
print  'Without Tor : %0.3f ms' % (duration*1000)
proxy=urllib2.ProxyHandler({"http" : "127.0.0.1:8118"})
var2=urllib2.build_opener(proxy)
begin_time2 = time.time()
var2.open('http://www.yahoo.com/')
end_time2 = time.time()
duration2=end_time2-begin_time2
print 'With Tor : %0.3f ms' % (duration2*1000)

print 'the difference is %0.3f' % ((duration2-duration)*1000) 
