class Rakkausp

  def initialize
    names = []
    File.readlines(ARGV[0]).each do |line|
      names.push(line.delete("\n"))
    end
    @listnames = names
  end


  def calculateallrp
    rakkaustotal = []
    @listnames.each_with_index do |name1, index1|
      if index1 < @listnames.length - 1
        @listnames[(index1+1)..-1].each do |name2|
          rakkaustotal.push({:rp => calculaterbnames(name1, name2), :name1 =>  name1, :name2 => name2})
        end
      end
    end
    return rakkaustotal
  end

  def calculaterbnames(name1, name2)
    total = name1.downcase + name2.downcase;
    pairs = []
    pairs.push(total.count('p'))
    pairs.push(total.count('a'))
    pairs.push(total.count('i'))
    pairs.push(total.count('r'))
    pairs.push(total.count('s'))

    pairs = calculaterppairs(pairs)
    while pairs.length > 2 do
      pairs = calculaterppairs(pairs)
    end

    return pairs[0]*10 + pairs[1]

  end

  def calculaterppairs(pairs)
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

g = Rakkausp.new()
list = g.calculateallrp
total99 = list.select{|list| list[:rp] == 99}
puts "teilla on " + total99.length.to_s + " kella rakkaus on 99!"

