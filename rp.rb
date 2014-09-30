class Rakkausp

  def initialize
    names = []
    File.readlines('fast_track_generoitu_nimilista.txt').each do |line|
      names.push(line.delete("\n"))
    end
    @listnames = names
  end

  def printer
    puts "#{@listnames}"
  end

  def extract(index)
    return @listnames[index]
  end

  def get
    return @listnames
  end

  def comparetest
    return comparenames(@listnames[0], @listnames[1])
  end

  def comparenames(name1, name2)
    total = name1.downcase + name2.downcase;
    pairs = []
    pairs.push(total.count('p'))
    pairs.push(total.count('a'))
    pairs.push(total.count('i'))
    pairs.push(total.count('r'))
    pairs.push(total.count('s'))

    pairs = calculaterp(pairs)
    while pairs.length > 2 do
      pairs = calculaterp(pairs)
    end

    return pairs[0]*10 + pairs[1]

  end

  def calculaterp(pairs)
    newpairs = []
    pairs.each_with_index do |value, index|
      if index < pairs.length - 1
        newpairs[index]= supersum(value, pairs[index+1])
      end
    end
    return newpairs
  end


  def supersum(x,y)
    if x + y < 10
      return x+y
    else
      return (x+y)/10 + (x+y).modulo(10)
    end
  end

end

