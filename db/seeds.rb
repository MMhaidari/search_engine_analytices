# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Article.destroy_all
Article.create(title: 'Introduction to Ruby on Rails')
Article.create(title: 'Getting Started with ActiveRecord')
Article.create(title: 'Mastering RESTful APIs in Rails')
Article.create(title: 'Building Responsive Web Applications with Turbo')
Article.create(title: 'Exploring StimulusJS for Modern Frontend Development')
Article.create(title: 'Ruby vs Python: A Comprehensive Comparison')
Article.create(title: 'The Art of Debugging in Rails')
Article.create(title: 'Optimizing Database Queries for Better Performance')
Article.create(title: 'Understanding Model-View-Controller (MVC) Architecture')
Article.create(title: 'Building Scalable Web Applications with Rails')
Article.create(title: 'Effective Use of JavaScript in Rails Applications')
Article.create(title: 'Responsive Design Principles for Web Developers')
Article.create(title: 'Deploying Rails Applications on Cloud Platforms')
Article.create(title: 'Continuous Integration and Deployment in Rails')
Article.create(title: 'The Future of Web Development: Trends and Technologies')
Article.create(title: 'Authentication and Authorization in Rails')
Article.create(title: 'Creating Custom APIs with Rails')
Article.create(title: 'Frontend Frameworks: A Comparison of React, Angular, and Vue')
Article.create(title: 'Advanced ActiveRecord Techniques for Rails Developers')
Article.create(title: 'Ruby Metaprogramming: Unleashing the Power of Code')
Article.create(title: 'Exploring the Latest Features of Rails 7')
Article.create(title: 'WebSockets in Rails: Real-time Communication Made Easy')
Article.create(title: 'Practical Tips for Writing Clean and Maintainable Code')
Article.create(title: 'Microservices Architecture: Pros and Cons')
Article.create(title: 'Testing Strategies for Rails Applications')
Article.create(title: 'Managing Dependencies with Bundler')
Article.create(title: 'Caching Strategies for Improved Performance')
Article.create(title: 'Effective Use of Git in Collaborative Development')
# Continue with additional articles...
