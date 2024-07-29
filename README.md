# README

## Overview of the Copywriter app

- User Input (basic styling) —> Submit —> Save in database —> Content sent to OpenAI API (using Ruby-openAI to request to the openAI API) —> OPENAI process, enhance and modify the content — > Response to App along with the original notes
1. **Prerequisites**
- Before you install Rails, you should check to make sure that your system has the proper prerequisites installed. These include **Ruby, and SQLite3**.
- Read more about [Ruby on Rails 7](https://guides.rubyonrails.org/) , [Ruby language](https://www.ruby-lang.org/en/documentation/), [Ruby OpenAI](https://rubygems.org/gems/ruby-openai/versions/0.1.0), [Flexible authentication solution for Rails](https://rubygems.org/gems/devise/versions/4.9.2), [Help and documentation for the Ruby programming language](https://ruby-doc.org/)
1. **Setting Up and Install:**
- First: check Ruby, and SQLite in your command :

```
$ ruby --version
ruby 2.7.0 

$ sqlite3 --version
```

- Install it as follows (MacOs):

Rails requires Ruby version 2.7.0 or later. It is preferred to use the latest Ruby version. If the version number returned is less than that number (such as 2.3.7, or 1.8.7), you'll need to install a fresh copy of Ruby.

- Install Rails:

```
gem install rails / sudo gem install rails 

//Verify the Rails installation:
rails --version
```

- Create new Rails app:

```
rails new copywriter_app
cd copywriter_app
```

- **Initialize a Git repository:**

```
git init
git add .
git commit -m "Initial commit"
```

- **Set Up User Authentication:**

```
// Add Devise gem to your Gemfile:
gem 'devise'
```

- Install the gem and generate User model:

```
bundle install
rails generate devise:install
rails generate devise User
rails db:migrate
```

- Configure authentication views:

```
rails generate devise:views
```

1. **Install the Devise gem:**
    
    ```
  
    bundle install
    
    ```
    
2. **Set up Devise:**
    
    ```
 
    rails generate devise:install
    
    ```
    
3. **Generate the User model with Devise:**
    
    ```
  
    rails generate devise User
    
    ```
    
4. **Run the database migrations:**
    
    ```
  
    rails db:migrate
    
    ```
    
5. **Generate Devise views (optional, for customization):**
    
    ```
  
    rails generate devise:views
    
    ```
    

### 

### Next Steps

1. **Generate Controllers and Views for Notes:**
2. **Update Routes:**
3. **Create and Style Views:**
4. **Integrate OpenAI:**
5. **Set Up Data Storage:**
6. **Test-Driven Development (TDD):**

### Detailed Steps

### 1. Generate Controllers and Views for Notes

1. **Generate Notes Controller:**
    
    ```
    rails generate controller Notes index new edit show
    
    ```
    
2. **Create the Note model:**
    
    ```
  
    rails generate model Note user:references content:text enhanced_content:text
    rails db:migrate
    
    ```

### Integrate OpenAI

1. **Add the `ruby-openai` gem to your Gemfile:**
    
    ```
   
    gem 'ruby-openai', '~> 0.1.0'
    
    ```
    
2. **Install the gem:**
    
    ```
   
    bundle install
    
    ```
    
3. **Configure OpenAI in an initializer (`config/initializers/openai.rb`):**
   OpenAI.api_key = ENV['OPENAI_API_KEY']

### Deploy on Heroku 
Read through this Document instruction : https://devcenter.heroku.com/articles/getting-started-with-rails7
