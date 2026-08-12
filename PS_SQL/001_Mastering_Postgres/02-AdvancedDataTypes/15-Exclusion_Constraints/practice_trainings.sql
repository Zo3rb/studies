-- Lesson 15: Exclusion Constraints (trainings)

CREATE EXTENSION IF NOT EXISTS btree_gist;

DROP TABLE IF EXISTS room_bookings;

CREATE TABLE room_bookings (
    booking_id BIGSERIAL PRIMARY KEY,
    room_id INTEGER NOT NULL,
    booking_slot TSTZRANGE NOT NULL,
    booked_by TEXT NOT NULL,
    CONSTRAINT room_booking_no_overlap
        EXCLUDE USING gist (
            room_id WITH =,
            booking_slot WITH &&
        )
);

INSERT INTO room_bookings (room_id, booking_slot, booked_by) VALUES
(101, tstzrange('2026-07-01 09:00+00', '2026-07-01 10:00+00', '[)'), 'ali'),
(101, tstzrange('2026-07-01 10:00+00', '2026-07-01 11:00+00', '[)'), 'mona'),
(102, tstzrange('2026-07-01 09:30+00', '2026-07-01 10:30+00', '[)'), 'sara');

SELECT booking_id, room_id, booking_slot, booked_by
FROM room_bookings
ORDER BY room_id, booking_slot;

