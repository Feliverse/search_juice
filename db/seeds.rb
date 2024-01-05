require 'faker'

article_titles = [
  'Introduction to Web Development',
  'The Future of Artificial Intelligence',
  'Mastering React Framework',
  'How is Emil Hajric Doing', 
  'Understanding Data Structures',
  'What is a Good Car', 
  'Frontend vs Backend Development',
  'Design Principles for Mobile Apps',
  'Creating Responsive Websites',
  'Database Optimization Techniques',
]

30.times do
  Article.create(
    title: article_titles.sample,
    body: Faker::Lorem.paragraph(sentence_count: 10) 
  )
end

ips = [
  '192.168.0.1', '10.0.0.1', '172.16.0.1', '127.0.0.1', '35.245.189.144',
  
]

queries = [
  'Ruby on Rails tutorial', 'React frontend development', 'Database design principles',
  'Responsive web design examples', 'Inclusive design best practices', 'What is a Good Car',
  'How is Emil Hajric Doing', 'How is Emil Hajric Doing'
]


50.times do
  SearchQuery.create(
    ip_address: ips.sample,
    query: queries.sample
  )
end

puts 'Seed data generated successfully.'