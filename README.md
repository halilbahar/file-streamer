# file-streamer

## Preparation

Create a log file for the streaming server:

```
touch srs/srs.log
```

Copy the template for the URLs that will be streamed:

```
cp ffmpeg/urls.example.txt ffmpeg/urls.txt
```

In the **urls.txt**, you specify your URL and by what name you can retrieve as HLS. You need to seperate them by an semicolon *;*. Use a new line for multiple streams.

```
http://some-domain.com/my-video.mp4;example-stream
```

You can retrive the example above with this following URL as HLS:

```
http://localhost:8080/file/example-stream.m3u8
```