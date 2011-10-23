require 'blazing'

#
# Stuff borrowed from carlhuda/bundler
#
RSpec.configure do |config|
  def capture(stream)
    begin
      stream = stream.to_s
      eval "$#{stream} = StringIO.new"
      yield
      result = eval("$#{stream}").string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end

    result
  end

  def destination_root
    File.join(File.dirname(__FILE__), 'sandbox')
  end
end
