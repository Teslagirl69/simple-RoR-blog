xml.instruct! :xml, :version=>"1.0", :encoding=>"UTF-8"
xml.rss("version" => "2.0", "xmlns:dc" => "http://purl.org/dc/elements/1.1/") do
  xml.channel do
    xml.title("Articles: ")
    xml.name @article.title
    xml.tag!('article:text', @article[:text])
    # xml.article do
     #    xml.title(title(@article))
     #    xml.description(text(@article))
     #  end
    end
  end
