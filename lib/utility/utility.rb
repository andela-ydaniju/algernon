class String
  def snakify
    gsub!("::", "/")
    gsub!(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
    gsub!(/([a-z\d])([A-Z])/, '\1_\2')
    tr!("-", "_")
    downcase!
    self
  end

  def camelify
    return self if self !~ /_/ && self =~ /[A-Z]+.*/
    split("_").map(&:capitalize).join
  end

  def constantify
    Object.const_get(self)
  end

  def pluralize
    gsub!(/([^aeiouy]|qu)y$/i, '\1ies')
    gsub!(/(ss|z|ch|sh|x)$/i, '\1es')
    gsub!(/(is)$/i, "es")
    gsub!(/(f|fe)$/i, "ves")
    gsub!(/(ex|ix)$/i, "ices")
    gsub!(/(a)$/i, "ae")
    gsub!(/(um|on)$/i, "a")
    gsub!(/(us)$/i, "i")
    gsub!(/(eau)$/i, "eaux")
    gsub!(/([^saeix])$/i, '\1s')

    self
  end
end
