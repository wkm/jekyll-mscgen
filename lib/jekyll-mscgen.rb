require 'liquid'
require 'jekyll-mscgen/version'
require 'open3'
require 'cgi'

module Jekyll
  # defaults which get stripped out
  class MscgenBlock < Liquid::Block
    def initialize(tag_name, text, tokens)
      super
    end

    # remove basic styling from output
    def purify(output)
      [
        'stroke="black"', 'font-family="Helvetica"', 'font-size="12"',
        /textLength="\d+"/
      ].each do |pattern|
        output.gsub! pattern, ''
      end

      output
    end

    def render(context)
      @text = @nodelist.join('')
      @text = "msc {\n #{@text} \n}"

      Open3.popen3('mscgen -i- -o- -T svg') do |stdin,out,err|
        begin
          stdin.puts(@text)
          stdin.close
        rescue Error
          puts 'error generating mscgen chart'

        ensure
          errors = err.read.strip
          output = out.read.strip
          if errors != "" and errors != nil
            puts "mscgen error: #{errors}"
            errors = "<div style='color: red; background: \#ffeeee;'>#{CGI.escapeHTML(errors)}</div>"
            if output != nil
              output = CGI.escapeHTML(output)
            end
          end
        
          output = output.lines.drop(2).join('')
          output = purify(output)

          return "<div class='mscgen-chart'>#{errors}#{output}</div>"
        end
      end
    end
  end
end


Liquid::Template.register_tag('mscgen', Jekyll::MscgenBlock)