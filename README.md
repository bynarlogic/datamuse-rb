# DatamuseRb

DatamuseRb is yet another Ruby wrapper for the wonderful [Datamuse API](https://www.datamuse.com/api/). The approach for this gem is a little different. DatamuseRb extends the Ruby String Class with Datamuse methods. Methods can be chained much like the actual Datamuse API allows.

Example: Words related to duck that start with the letter b

```ruby
"duck".means_like.spelled_like("b*")
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'datamuse_rb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install datamuse_rb

## Usage

DatamuseRB currently supports all of the /words functions. Please visit the [datamuse documentation](https://www.datamuse.com/api/) for more details. Supported Datamuse Methods Include: [means_like: :ml, sounds_like: :sl, spelled_like: :sp, related_popular_nouns: :rel_jja, related_popular_adjectives: :rel_jjb, related_synonyms: :rel_syn, related_triggers: :rel_trg, related_antonyms: :rel_ant, kind_of_hyponyms: :rel_spc, general_hyponyms: :rel_gen, comporomise_hyponyms: :rel_com, part_of_meronyms: :rel_par, frequent_followers: :rel_bga, frequent_predecessors: :rel_bgb, related_rhymes: :rel_rhy, approximate_rhymes: :rel_nry related_homophones: :rel_hom,consonant_match: :rel_cns].

Basic Usage:

```ruby
#Call on any string
"ruby".means_like
 => #<DatamuseRB::DatamuseResult word="red", score=84986, tags=["syn", "n", "adj"]>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/bynarlogic/datamuse-rb.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
