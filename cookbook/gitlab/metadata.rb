long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
%w{ git redisio build-essential python readline openssl openssh perl xml zlib rbenv }.each do |cb_depend|
  depends cb_depend
end
%w{ debian ubuntu }.each do |os|
  supports os
end
