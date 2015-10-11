# this class takes care of
# parsing the parameters
# creating url
class ParameterParser
  private

  @@valid_args = [:category, :price, :subcategory, :location, :material]

  def validate_args
    # the home page is ajax loaded so a default parameter is set
    # to force the scraper to get data
    ARGV[0] = '--category=1' if ARGV.empty?
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
    # create a string based on the parameters
    # assuming there was error check (big assumption for now)
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
              pinkoi --category=1 --price=0,100
              pinkoi --category=1 --subcategory=205 --price=0,100'
  end
end
