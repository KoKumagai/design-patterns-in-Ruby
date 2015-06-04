# AbstractExpression
class HtmlExpression
  def initialize(expression)
    @expression = expression
  end
  
  def parse
    raise NotImplementedError, "You should implement #{self.class}##{__method__}"
  end
end

# NonterminalExpression1
class HeaderBeginExpression < HtmlExpression
  def parse
    '<head>'
  end
end

# NonterminalExpression2
class HeaderEndExpression < HtmlExpression
  def parse
    '</head>'
  end
end

# NonterminalExpression3
class TitleBeginExpression < HtmlExpression
  def parse
    '<title>'
  end
end

# NonterminalExpression4
class TitleEndExpression < HtmlExpression
  def parse
    '</title>'
  end
end

# NonterminalExpression5
class BodyBeginExpression < HtmlExpression
  def parse
    '<body>'
  end
end

# NonterminalExpression6
class BodyEndExpression < HtmlExpression
  def parse
    '</body>'
  end
end

# NonterminalExpression7
class BodyBeginExpression < HtmlExpression
  def parse
    '<body>'
  end
end

# NonterminalExpression8
class BodyEndExpression < HtmlExpression
  def parse
    '</body>'
  end
end

# Parser
class HtmlParser
  def initialize(expressions)
    @expression_list = Array.new
    expressions.split("\n").each do |expression|
      case expression
      when 'he'
        @expression_list << HeaderBeginExpression.new(expression)
      when '/he'
        @expression_list << HeaderEndExpression.new(expression)
      when 'ti'
        @expression_list << TitleBeginExpression.new(expression)
      when '/ti'
        @expression_list << TitleEndExpression.new(expression)
      when 'bo'
        @expression_list << BodyBeginExpression.new(expression)
      when '/bo'
        @expression_list << BodyEndExpression.new(expression)
      else
        @expression_list << expression
      end
    end
  end

  def parse
    html = "<!DOCTYPE html>\n"
    @expression_list.each do |expression|
      if expression.class.ancestors.include?(HtmlExpression)
        html << expression.parse
      else
        html << expression
      end
      html << "\n"
    end
    html << '</html>'
  end
end

# Context
class HtmlContext
  attr_accessor :expressions
  
  def initialize(expressions)
    @expressions = expressions
  end
  
  def parse
    HtmlParser.new(@expressions).parse
  end
end


############### Usage ###############
text = <<"EOS"
he
ti
My Title
/ti
/he
bo
My Body
/bo
EOS

context = HtmlContext.new(text)
html = context.parse
puts html
#=> <!DOCTYPE html>
#=> <head>
#=> <title>
#=> My Title
#=> </title>
#=> <body>
#=> My Body
#=> </body>
#=> </html>