#Dockersonic

Dockerfile for Subsonic 6 with FFMPEG

Usage

Create the data container with:

sudo docker run --name subsonic_data \
    -v /data/music:/var/music \
    emauve/subsonic:6.0 /bin/true

    In this example, the actual music files are managed in the /data/music.

    Data container manages only the subsonic configuration information.

After crerateing this run subsonic_app:

sudo docker run -d -t -i \
    --publish 8100:4040 \
    --name="subsonic_app" \
    --volumes-from subsonic_data \
    emauve/subsonic:6.0

    In this example, we specify port 4040 to 8100.

Port (default)

    4040

Data (default)

    /var/music
    /var/subsonic

