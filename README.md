# Colors

**Colors** is a library of 1x1 PNGs, available at [colors.awesometm.com](http://colors.awesometm.com). It's an asset server, of sorts. 

It's also a 1x1 PNG generator. Just go to the URL of the PNG you want (#444444 would be [http://colors.awesometm.com/444444.png](http://colors.awesometm.com/444444.png)), and you can save the PNG to your own server.

### FAQs

#### How do I use Colors?

Just tell your CSS file to use our URL. Like this:

		div.column {
		  background: url(http://colors.awesometm.com/444444.png) 0 0 repeat-y;
		  float: left;
		  margin 10px;
		  padding: 0 10px;
		}

In the above example, we pointed at 444444.png, but you can actually use any of the following syntaxes:

    http://colors.awesometm.com/444444
    http://colors.awesometm.com/444444.png
    http://colors.awesometm.com/444
    http://colors.awesometm.com/444.png

You've probably figured this out, but the value you use (in this case, 444444) is the hexadecimal code for the color you want. If you use the shortened form (123.png), Colors will automatically convert that to the appropriate longform hex code (112233.png).

#### So what does that get you?

It gets you a 1 pixel by 1 pixel PNG, of the color of your choice. These are useful as CSS background images, when you don't want to affect the width of your box model with a border-width.


#### Who's behind this?

[Charlie Park](http://charliepark.org)

#### If I have a suggestion, what's the best way to get in touch?

For feature requests or general "hey, this is cool!"-type notes, send a message via Twitter: \([@charliepark](http://twitter.com/charliepark)\).

For code suggestions ... Colors is totally open-source (it's all right here on Github), so feel free to poke around. The app was built using the [Sinatra](http://www.sinatrarb.com/) web framework, and uses the [Chunky_PNG](http://github.com/wvanbergen/chunky_png) gem. If you have any suggestions on ways it could be improved, please let me know! Again, [@charliepark](http://twitter.com/charliepark) is best for that.