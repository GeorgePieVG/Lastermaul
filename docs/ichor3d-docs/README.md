
# Ichor


The *Ichor* project aims to create a complete, free content first
person shooter game, but *Ichor* by itself is just the raw
material for a game.  
It must be paired with a compatible engine to be played.

There is a massive [back
catalog](http://blood.freeminded.de/), spanning over a decade,
containing thousands of *Blood* levels and other modifications
(“mods”) made by fans of the game.
*Ichor* aims to be compatible with these and allows most to be
played without the need to use non-free software.

For more information, see ~~http://ichor3d.github.io/~~
 not available at the moment.

# How to Play

Since *Ichor* is only the game data, you will still need to
download an engine.
These are also often termed “source ports” by the community.  
There are an overwhelming number of choices available, a lengthy list of
 which is available on the
[Blood Wiki](https://blood-wiki.org/index.php/List_of_Source_Ports_and_Recreations).

One particularly recommended by the *Ichor* project is
[NBlood](https://lerppu.net/wannabethesis/).  
This engine offers good support for
single-player and the majority of mods created for both
*Blood* and *Ichor*.

As of April 2021, it is not yet ready for release, and is still very early in development.

# What “Free” Means

When we speak of free content or software, we refer to the movement in
which your freedoms to use, copy, modify, and study a work is not
infringed.  
For example, you may freely use *Ichor* for any purpose you see
fit, you may redistribute it to anyone without needing to ask
for permission, you may modify it (provided you keep the license
intact, see `COPYING`), and you may study it.

You may read more about free software at the [GNU](http://www.gnu.org/)
and [Free Software Foundation](http://www.fsf.org/) websites.

# Contributing to Ichor

Contributions to *Ichor* are always welcome, however there are a
few guidelines that should be followed:

## Intellectual property

We know people hate legalese, but this is important. This applies to
**everything** which is submitted.

You must be careful when basing on existing graphics or sounds.
Most *Blood* projects are lax on reusing intellectual property.  
There are many mods which contain modified *Blood* models, for example.
However, due to the nature of this project, we do not have the same
liberty to rip as we please.

The general rules go as follows:

  1. You must have permission for everything you submit.  
     If you make your own resources, do not base on resources from
     *Blood* or any other restricted work.  
     If you take work from other places, please make sure that the work
     is freely-licensed or that you obtain permission to include it in
     the *Ichor* project.  
     They may not place additional restrictions compared to the normal
     *Ichor* license.

  2. Do not try to emulate *Blood* resources exactly.  
     Where possible, put effort to make new versions look visibly
     different from *Blood*.  
     This is a tough call, because our compatibility with *Blood* mods
     limits how far we can deviate, but it is feasible.

  3. Be especially careful of “free textures” (or “free sounds” or
     “free graphics”) sites.  Although these would appear at first to
     be okay to use, many are free for “non-commercial use only.”
     One of the things we want to be able to do is put this in
     GNU/Linux distributions (which can be sold or developed
     commercially).

## Levels

Levels for *Ichor* must be able to run in BloodGDX and the original MS-DOS *Blood* executable.

It is sensible to also heed the following guidelines:

  1. Make sure that skill levels are implemented, and that all
     multiplayer start points, both cooperative and deathmatch, are
     present.

  2. Try to make levels appropriately difficult for their position
     within the progression of the game.  Also bear in mind that not
     all players may be as skilled a player as you.

  3. While unrestricted by limits, do not make excessively complicated
     scenes.  
     It is desirable that *Ichor* levels should be playable on
     low-powered hardware, such as phones and old computers.

## Animations

Animations for *Ichor* must not make use of any special functions, and should only use the original triggers from the original animations.

It is sensible to also heed the following guidelines:

1. Make sure the triggers happen at the correct time, no matter what. This will ensure demo compatibility. Any issues with this should be brought up on the issues tracker.
	
2. You may base your animations off the originals, but do NOT copy them exactly unless absolutely necessary.
	
3. Do not use an excessive amount of tiles for each animation.

## Submitting your work

The most common, and a fairly simple method, to submit your work is by
posting it on [`#ichor-3d` in the LibreQuake discord.](https://discord.gg/H9gwFTQ)

This allows a quick cycle or development and feedback.

An alternative to using the Discord, is to post your submission on the
[issue tracker](https://github.com/ObsidianPlague/Ichor/issues), which
may also be peer-reviewed and provide a feedback cycle.

Unfortunately, the Ichor project cannot provide hosting space in
the form of a web page nor FTP, however there are many free file hosts
to use when you need a location to upload files.  
Sites and services such as [Dropbox](https://www.dropbox.com/) and
[Mega](https://mega.co.nz/), as well as others, are common and should
be simple to use.

### Crediting information

*Ichor* is made up of submissions from many people all over the
globe.  
All of them, including **you**, deserve credit!  
Please do not forget to provide your name and email when submitting
resources.

### Using Git

You can also commit on a clone of the *Ichor* repository,
although this is a technical task and it is okay to let other
*Ichor* maintainers to do it instead: that is our normal mode of
operation.  
However, pull requests are much appreciated and you may submit them in
any manner you wish, with GitHub’s direct pull requests being the
simplest, but by far not the only means.

*Ichor* uses the commit message style commonly seen in
distributed version control systems, adopted by projects such as Linux
and Git.
For an explanation of this style, see
[How to Write a Git Commit
Message](https://chris.beams.io/posts/git-commit/).
