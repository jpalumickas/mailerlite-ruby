# Custom String extensions
class String
  BLANK_RE = /\A[[:space:]]*\z/

  def underscore
    gsub(/::/, '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr('-', '_')
      .downcase
  end

  def blank?
    BLANK_RE.match(self)
  end
end
