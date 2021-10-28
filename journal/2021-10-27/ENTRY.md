
### [Download Markdown File](https://morgs9.xyz/journal/2021-10-27/ENTRY.md)

# October 27th, 2021

### Hello everyone! Hope you all are doing well!

So the main point of this entry is how you can prevent Spotify auto-pause on Discord without client mods,
but first, you may notice that this looks... different.
Well that's because:

#### I'm writing this all in Markdown now!
It's a lot easier for me to write all of this in Markdown (i don't need to put ``<p>`` before every goddamn paragraph now, that's a big one lol)
And it's actually surprisingly easy to convert Markdown to HTML with just some software tools. (if you're wondering, I use [Stackedit](https://stackedit.io))

You may also notice the `Download Markdown File` button at the top of the screen. So now if you wish to download this and read it offline, you can!


Anyways, onto the main point of the entry...


### Discord. We all use it now.
One of the biggest chat services in the world right now.

*Especially since the pandemic* ***cough cough***

Anyways, it has a feature where you can link your Spotify account so your friends can see what your listening to, and either listen to it themselves, or even in a Listen Along.

Unfortunately, with all this comes one **really** annoying drawback (at least for the people with really sensitive and audio bleedy microphones):

#### Auto-Pause

In order to comply with Spotify's TOU (Terms of Use), to prevent audio being played over mic, if you transmit for more than 30 seconds, it automatically pauses your music.

Now from what I've seen, this feature just causes more harm then good. Why?

Well for one, if someone **REALLY** wanted to play Audio over mic, they could just... unlink their Spotify from Discord, or, just use another service, like YouTube.

Now you could make the same argument for me: `just unlink your spotify lol`
I'm gonna answer that with another question: why?
I shouldn't have to give up a useful feature just because of Discord's half-assed attempt to prevent Music Piracy.
So, I'm not gonna.

Instead, I will show you how you can bypass this, without client modding.

Now lemme just preface this with:

## **I AM NOT RESPONSIBLE FOR ANY MODERATOR ACTIONS TAKEN ON YOUR ACCOUNT IF YOU GET FOUND OUT FOR DOING THIS**
**There is a decently high chance that Discord won't like what we will be doing here.**
**What we're basically doing is removing Discord's ability to access the Playback Modification part of the Spotify API**
**And while** ***technically,*** **this isn't against Discord's TOS, they are a private company, and they can do whatever the fuck they want with your account for any reason.** [**And knowing how petty**](https://www.reddit.com/r/internetdrama/comments/9tdnl9/discord_drama_uallthefoxes_now_from_the_trust_and/) [**Discord's Mod team can be,**](https://youtu.be/UGJhITr7190) **They could ban you for this if they REALLY wanted to.**
**In any case, if you want to be risk-free of being banned, don't do this, and just use Discord within it's TOS.**
## **ONCE AGAIN, I AM NOT RESPONSIBLE FOR ANY MODERATOR ACTIONS TAKEN ON YOUR ACCOUNT IF YOU GET FOUND OUT FOR DOING THIS**

Now with that out the way, let's get back to it.

So first, unlink your Spotify from Discord.
Open Discord and go to `User Settings > Connections`
and click the X button next to your Spotify account. It should look like this:

![Image of Discord Connection](https://morgs9.xyz/journal/2021-10-27/images/1.png)

Next, go to your [Spotify Account Settings Page](https://account.spotify.com), and go to Apps. It should be near the bottom of the page. Find `Discord` and click Remove Access. That should look something like this:

![Image of Spotify Remove Access page](https://morgs9.xyz/journal/2021-10-27/images/2.png)

Now, go back to Discord and go back to `User Settings > Connections` and click the Spotify link button. This will open a new tab in your browser.
**Note that in the browser version of Discord, this will open in a temp window. For this to work, you'll need to be in an actual tab. To switch to this, right click the top of the window (the part that shows the name of the window, not the URL bar.) and click something that looks like "Open in Tab". It may look different depending on your browser.**

Now login with Spotify if prompted. At this point, you should be at the authorize screen. That should look something like this:

![Spotify Authorize Screen](https://morgs9.xyz/2021-10-27/images/3.png)

We're gonna be messing with the Authorize URL to do this.
The URL should look something like this:
```
https://accounts.spotify.com/en/authorize?response_type=code&client_id=redacted&redirect_uri=https:%2F%2Fdiscord.com%2Fapi%2Fconnections%2Fspotify%2Fcallback&scope=user-read-private%20user-read-playback-state%20user-modify-playback-state%20user-read-currently-playing&state=redacted
```
Now the way that Discord authenticates with Spotify's API is with something called OAuth, and OAuth bases permissions on something called scopes. 
Notice the section of this URL?: `scope=user-read-private%20user-read-playback-state%20user-modify-playback-state%20user-read-currently-playing`
These are the scopes that discord are requesting access for.
The one we're interested in however, is `user-modify-playback-state`. That's the scope that allows Discord to modify our playback state and in turn, auto-pause.
We are gonna be removing that scope, and in turn, removing Discord's access to this part of the API. To do this, remove: `user-modify-playback-state%20`. 

Once you do that, reload the page. If you did it all right, your URL should look like this:

```
https://accounts.spotify.com/en/authorize?response_type=code&client_id=redacted&redirect_uri=https:%2F%2Fdiscord.com%2Fapi%2Fconnections%2Fspotify%2Fcallback&scope=user-read-private%20user-read-playback-state%20user-read-currently-playing&state=redacted
```
And your Spotify Authorize screen should now look like this:

![Spotify Authorization screen without modify scope](https://morgs9.xyz/2021-10-27/images/4.png)

Notice the lack of the modify playback permission?
If you did it right, simply click Authorize.
Discord will now no longer be able to auto-pause!

Now of course, like a lot of things in life, **there are some drawbacks.**
For one, you can no longer join other's listen-alongs. (you can still host your own, though.)
And you can no longer use the Listen on Spotify button if you wanna listen to a song a friend is listening to.

But honestly, I rarely use those features anyways, so I don't really mind.

Anyways, that about wraps it up! I hope this guide was useful!

If you have any questions, concerns, or if I messed anything up, do e-mail me at [MorgS9@pm.me](mailto:MorgS9@pm.me).

## Thanks for reading, and I hope you have a good day!