module Golf
  def self.hole_1 a
    a.sort_by{|b|
      b.count"aeiouAEIOU"
    }
  end

  def self.hole_2 a
    Array(a).inject(0){|b,c|
      b+c*c
    }
  end

  def self.hole_3 a,b
    b.each{|c|
      a.gsub!(/\b#{c}\b/){"#{c[0]}#{?**(c.size-1)}"}
    }
    a
  end

  def self.hole_4 a
    %w{one two three four five six seven eight nine ten}.each_with_index{|b,c|
      a.gsub! /\b#{c+1}\b/,b
    }
    a
  end

  def self.hole_5 a
    b=a.downcase.gsub(/[^a-z]/,'').chars.sort.uniq
    c=[[b.shift]]
    b.each{|d|d==c[-1][-1].succ ? c[-1]<<d :c<<[d]}
    c.map{|d|
      d[2]?"#{d[0]}-#{d[-1]}":d.join(", ")
    }.join ", "
  end

  def self.hole_6 a
    a==1?[1]:(a==2?[1,1]:(b=hole_6(a-1);b<<b[-2]+b[-1]))
  end

  def self.hole_7
    "#{10.downto(1).map{|a|
      (["#{a} green bottle#{a==1?'':?s} hanging on the wall"]*2+["and if one green bottle should accidentally fall","There'd be #{a-1} green bottle#{a==2?'':?s} hanging on the wall"]).map{|b|hole_4(b).capitalize.sub ?0, 'no'}.join("\n")
    }.join "\n\n"}\n"
  end

  def self.hole_8 a
    "<p>\n#{a.strip.gsub /\n{2,}/,"\n</p>\n<p>\n"}\n</p>\n"
  end

  def self.hole_9 a,b
    b.size.downto(1){|c|
      b.chars.each_cons(c){|d|
        e=d.join
        return e if a=~/#{e}/
      }
    }
    ""
  end
end
