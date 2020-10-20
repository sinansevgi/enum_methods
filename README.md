![](https://img.shields.io/badge/Microverse-blueviolet)

# Enumerable
> Enumerable is a collection of iteration method, a Ruby module and a great part of what makes ruby a great programming language. In this project, we try to customize some of the Ruby enumerable functions.

## Setup Instruction
* Clone this Repo
* Navigate to project Directory
* Now, to test each function go to the end of the page and do the following.

- For my_each 
 ```ruby
 my_each ([3, 4, 5, 6]) do |item|
   print item
 end
```
- For my_each_with_index
```ruby
 my_each_with_index([3, 4, 5, 6]) do |index, item|
  puts "Index : #{index} and Value #{item}"
 end
```
- For my_select
```ruby
  my_select([3, 4, 5, 6, 2], 6) do |item|
    puts item
  end
```
- For my_all
```ruby
  my_All_res = my_all(%w[dcd fdfdf dfdf dfdf dfdfd]) do |item|
    true if item.length > 6
  end
  puts my_All_res
```
- For my_any
```ruby
 my_any_res = my_any(%w[dcd fdfdf dfdf dfdf dfdfdas]) do |item|
   true if item.length > 6
 end
puts my_any_res
```
- For my_any
```ruby
my_none_res = my_none(%w[dcd fdfdf dfdf dfdf dfdf]) do |item|
  true if item.length > 6
end
puts my_none_res
```
- For my_map
```ruby
print my_map([3, 234, 123, 2, 1, 23],:temp)
```
- For my_inject
```ruby
print my_inject([3, 234, 123, 2, 1, 23], 0,:temp)
```

* Finally, If you have ruby installed in your system, just run `bubblesort.rb`

## Live Demo
[Live Demo Link](https://repl.it/@rukundoeric/enumerable)

## Built With

- Ruby

## Authors

👤 **Rukundo Eric**

- GitHub: [@rukundoeric](https://github.com/rukundoeric)
- Twitter: [@rukundoeric005](https://twitter.com/rukundoeric005)
- LinkedIn: [Rukundo Eric](https://www.linkedin.com/in/rukundo-eric-000bba181/)

👤 **Sinan Sevgi**

- GitHub: [@sinansevgi](https://github.com/sinansevgi)
- LinkedIn: [@sinansevgi](https://www.linkedin.com/in/sinan-s-52559437/)
- Twitter: [@nativeofcyber1](https://twitter.com/nativeofcyber1)



## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- We would like to thank our code reviewer and anyone else who participated in making this done.

## 📝 License

This project is [MIT](./LICENSE) licensed.
