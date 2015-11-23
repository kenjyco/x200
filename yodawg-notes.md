> Yo Dawg, I herd you like notes, so I put notes in yo notes so you can teach
> while you learn.

## How to make animated gifs

[diigo]: https://www.diigo.com/
[0]: http://www.linux-magazine.com/Online/Blogs/Productivity-Sauce/Create-Animated-GIFs-with-ImageMagick
![gif01](http://i.imgur.com/7cPG6Dc.gif)

- First, lookup "linux making animated gif" and look at the [first result][0]
  (which happens to use the `convert` tool from ImageMagick)
- Next, read through the text and pick out the important parts (I use the
  [diigo][] extension to highlight)
    - as you highlight (take screenshots of your window using the command `scrot
      -u`, after accessing the **run prompt** with hotkey `Super` + `r`)

![gif02](http://i.imgur.com/eSD6Apz.gif)

- When you are finished, you should have a bunch of files within a specific date
  range that all have the same dimensions (all information you can tell by the
  generated filenames)
    - use `ls` to list the png files modified within the last 10 minutes
    - use `feh` to view the recent images, matching a more specific filename
      pattern (perhaps the dimensions of a `tall` terminal window)
        - use the `->` key to move between the images
        - press `s` on any image that you want included in your animated gif
        - press `q` when you are finished going through the images
    - list the files that feh copied when you hit `s` (the names of these files
      start with `feh_`, followed by some random numbers, followed by the
      original file name)
    - use `convert` to create the animated gif from the `feh_` save files
        - 300 is also good number to try for the `-delay` option (more time to
          read what is happening between frames)
    - use `mkdir` to make a folder, then use `mv` to move the animated gif to
      the folder
    - use Python's `SimpleHTTPServer` module to "serve" your directory on port
      8080
        - in the web browser, visit [localhost:8080](http://localhost:8080) and click
          on the filename to view the animated gif
    ```
    % ls -1 *.png(.mm-10)
    % feh *757x1068*.png(.mm-10)
    % ls -1 feh_*757x1068*.png(.mm-10)
    % convert -delay 120 -loop 0 feh_*757x1068*.png(.mm-10) my-animated-gif.gif
    % mkdir how-to-gifs
    % mv my-animated-gif.gif how-to-gifs
    % cd how-to-gifs
    % python -m SimpleHTTPServer 8080
    ```

## How to create/edit a markdown file with vim

![gif03](http://i.imgur.com/wkSJTlP.gif)
