# JDoodle.rb

Ruby client library for [JDoodle API](https://www.jdoodle.com/compiler-api/docs).

## ⬇ Installing

### Bundler (recommended)

If you are using [Bundler](https://bundler.io/), add the following line to your Gemfile:

```
gem "jdoodle"
```

### Gem

If you are not using Bundler, use the `gem install` command:

```
$ gem install jdoodle
```

## 🕹 Usage

First you need to create an account on [JDoodle's website](https://www.jdoodle.com/). After that you must pick a plan. That will give you a client ID and a client secret. You will need that to make requests. Now you can go back to your Ruby project, require JDoodle and instantiate a client:

```ruby
# Requiring JDoodle client library
require "jdoodle"

# Instantiating a client
jdoodle = JDoodle::Client.new(
  client_id: "CLIENT_ID_HERE",
  client_secret: "CLIENT_SECRET_HERE"
)
```

### Credits

To check how many credits the client has spent today, use `Client#credit_spent`:

```ruby
jdoodle.credit_spent # => 4
```

### Executing Snippets

To execute a snippet of code, use `Client#execute`:

```ruby
# If your code takes up more than one line, it is
# recommended to use the squiggly heredoc syntax.
jdoodle.execute :c do
  <<~CODE
    #include <stdio.h>
    
    int main()
    {
      printf("Hello, World!");
      return 0;
    }
  CODE
end

# If not, go for the shorter way.
jdoodle.execute :ruby do
  'puts "Hello, World!"'
end

# Or
jdoodle.execute(:ruby) { 'puts "Hello, World!"' }
```

This will instantiate an `ExecutionResponse` object, which has four read-only attributes: `cpu_time`, `memory`, `output` and `status_code`.

```ruby
response = jdoodle.execute :python3 do
  'print("Hello, World!")'
end

p response.cpu_time # => "0.01"
p response.memory # => "5280"
p response.output # => "Hello, World!\n"
p response.status_code # => 200
```

## 📦 Dependencies

### Runtime

JDoodle.rb does not rely on any external dependencies. It uses Ruby's Net::HTTP to handle requests.

### Development

- [Bundler](https://rubygems.org/gems/bundler/versions/2.0.1) ~> 2.0 — to manage dependencies
- [Fasterer](https://rubygems.org/gems/fasterer/versions/0.5.1) ~> 0.5 — to look for code that could be faster
- [Rake](https://rubygems.org/gems/rake/versions/12.3.2) ~> 12.3 — to automate tasks
- [YARD](https://rubygems.org/gems/yard/versions/0.9.19) ~> 0.9 — to create beautiful documentation

## 📚 Documentation

Documentation is available online at [RubyDoc](https://rubydoc.info/github/maloucaze/jdoodlerb). To generate offline documentation, run the following Rake task:

```
$ bundle exec rake doc
```

## 📋 Rake Tasks

To run tasks, execute `bundle exec rake <task_name>` in your terminal.

| Task name |          Description        |
| --------- | --------------------------- |
| cleanup   | Run Rubocop & Fasterer      |
| doc       | Generate YARD documentation |

## 📑 License

JDoodle.rb is licensed under the [MIT License](LICENSE).

## ✏ Contributors

- [Nick Maloucaze](https://github.com/maloucaze) — author and maintainer

> **JDoodle.rb** by [Nick Maloucaze](https://github.com/maloucaze)