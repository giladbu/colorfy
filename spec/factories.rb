Factory.sequance :color do |n|
  rand(3)
end

Factory.define :cell do |c|
  c.color { Factory.sequance :color}
end
