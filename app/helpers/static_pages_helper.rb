module StaticPagesHelper

  def content_breviary(content)
    result = ""
    array = content.split('</p>')
    7.times { |index| result << "#{array[index]}</p>" }
    result << ' ......'
  end

end
