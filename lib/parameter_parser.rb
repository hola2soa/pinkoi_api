# this class takes care of
# parsing the parameters
# creating url

class ParameterParser
  # include ErrorHandler
  private
  @@valid_args = [:category, :price, :subcategory, :location, :material]

  def validate_args
    ARGV.each do |arg|
      begin
        match = /--(?<key>.*?)=(?<value>.*)/.match(arg)
        fail unless @@valid_args.include?(match[:key].to_sym)
        # should also validate value to match numbers
        # in other function
        @parameters[match[:key]] = match[:value]
      rescue StandardError
        abort "invalid usage...\n" << usage << "\n\n"
      end
    end
  end # end validate_args

  public
  def initialize
    @parameters = {}
    validate_args
  end

  def build_uri
    @parameters.map { |k, v| "#{k}=#{v}" }.join('&')
  end

  def usage
    'Usage: pinkoi [options]
      --category=(int)
      --price=[int[,int]]
      --location=[US, JP, HK, CN, TW]
      --subcategory=(int)
      --material=(int[,int,int,...])
      examples:
              pinkoi --category=1 --price=300
              pinkoi --category=1 --price=0,100'
  end
end
