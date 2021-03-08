desc 'Generate ERD png'
task :generate_erd_png do
  system "erd --inheritance --filetype=dot --direct --attributes=foreign_keys,content"
  system "dot -Tpng erd.dot > ./db/erd.png"
  File.delete('erd.dot')
  puts "erd.dot deleted"
  puts "ERD diagram saved to db/erd.png"
end
