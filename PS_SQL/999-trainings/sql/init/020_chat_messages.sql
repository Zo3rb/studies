CREATE TABLE chat_messages (
    id serial PRIMARY KEY,
    chat_room_id integer NOT NULL REFERENCES chat_rooms(id) ON DELETE CASCADE,
    sender_id integer NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    message text NOT NULL,
    created_at timestamptz NOT NULL DEFAULT now()
);
CREATE INDEX idx_chat_messages_room_id ON chat_messages(chat_room_id);