CREATE TABLE chat_participants (
    chat_room_id integer NOT NULL REFERENCES chat_rooms(id) ON DELETE CASCADE,
    user_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    joined_at timestamptz NOT NULL DEFAULT now(),
    PRIMARY KEY (chat_room_id, user_id)
);