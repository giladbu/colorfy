Factory.sequence :color do |n|
  rand(3)
end

Factory.define :cell do |c|
  c.color { Factory.sequance :color}
end

Factory.define :board do |b|
  b.size 4
end
