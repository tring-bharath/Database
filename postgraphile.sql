select * from "user"
SELECT enumlabel FROM pg_enum
JOIN pg_type ON pg_enum.enumtypid = pg_type.oid
WHERE pg_type.typname = 'user_gender_enum';
truncate table "user","userWatchlist","userHistory"

select * from "allVideos"
INSERT INTO "allVideos" (id, tags, "videoURL", thumbnail, likes, views) VALUES
(160767, 'ocean, beach, waves, breaking waves, drone, urban, european architecture, europe, coastal nature, nature, portugal, aerial', 'https://cdn.pixabay.com/video/2023/04/28/160767-822213540_medium.mp4', 'https://cdn.pixabay.com/video/2023/04/28/160767-822213540_medium.jpg', 1264, 233857),
(111204, 'sunset, nature, sky, dubai', 'https://cdn.pixabay.com/video/2022/03/18/111204-689949818_medium.mp4', 'https://cdn.pixabay.com/video/2022/03/18/111204-689949818_medium.jpg', 1378, 368046),
(206294, 'horses, animals, wildlife, running, ice, nature', 'https://cdn.pixabay.com/video/2024/03/31/206294_medium.mp4', 'https://cdn.pixabay.com/video/2024/03/31/206294_medium.jpg', 1167, 271234);
