module FleaHelper
  def short_title(m)
    if m[4].nil?
      m[0..3]
    else
      m[0..3] + '...'
    end
  end
end
