# jekyll-mscgen

A Jekyll plugin for generating message sequence charts using the `mscgen`
tool.

## Usage
You need to have `mscgen` installed (it's available through homebrew).

Expose the mscgen plugin to jekyll through a `_plugins/gems.rb` type file:

	require 'jekyll-mscgen'

Then you can create a chart as so:

	{% mscgen %}
	hscale = "0.7";
	# arcgradient = "2";

	swap1,host1,host2,swap2;
	|||;

	# proposal
	--- [ label=" attempt swap " ];

	swap1->host1 [ label="propose swap1" ];
	swap1<-host1 [ label="ok" ];

	# ...
	{% endmscgen %}

Generally you want to use CSS to add some styling, for example:

	svg {
		line {
			color: #333;
		}
	}

But expand as you wish:

![Image](https://raw.github.com/wkm/jekyll-mscgen/master/doc/samplemsc.png)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
