# To change this template, choose Tools | Templates
# and open the template in the editor.

#assuming all sides provided are more than zero
class TriangleClassifier
  
  def is_triangle?(a,b,c)
      a+b >c && a+c >b && b+c >a
  end

  def classify(len1, len2, len3)
    unless is_triangle(len1,len2,len3)
      raise ArgumentError, 'Arguments are not valid value for triangle'
    else
      if ((len1 == len2) || (len2 == len3) || (len1 == len3))
       return :isosceles
      elsif ((len1 == len2) && (len2 == len3) && (len1 == len3))
        return :equilateral
      else
        return :scalene
      end
  end
  end
end
