# Component
class AbstractFile
  attr_accessor :name

  def ls(prefix)
    raise NotImplementedError, "You should implement #{self.class}##{__method__}"
  end

  def remove(file)
    raise NotImplementedError, "You should implement #{self.class}##{__method__}"
  end
end

# Composite
class Directory < AbstractFile
  def initialize(name)
    @name = name
    @files = Array.new
  end

  def add(file)
    @files << file
  end

  def ls(prefix="")
    puts(prefix + "/" + @name)
    @files.each do |file|
      file.ls(prefix + "/" + @name)
    end
  end

  def remove(file)
    @files.delete file
  end
end

# Leaf
class RealFile < AbstractFile
  def initialize(name)
    @name = name
  end

  def ls(prefix = "")
    puts(prefix + "/" + @name)
  end

  def remove(file)
    @files.delete file
  end
end


############## Usage ##############
root_dir = Directory.new("root")
sub_dir = Directory.new("sub")
file1 = RealFile.new("file1")
file2 = RealFile.new("file2")

sub_dir.add(file1)
root_dir.add(sub_dir)
root_dir.add(file2)

root_dir.ls
#=> /root
#=> /root/sub
#=> /root/sub/file1
#=> /root/file2

root_dir.remove(sub_dir)

root_dir.ls
#=> /root
#=> /root/file2