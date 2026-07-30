-- Lesson 10: Bit Strings (trainings)

DROP TABLE IF EXISTS account_flags;

CREATE TABLE account_flags (
    account_id BIGSERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    permissions BIT(8) NOT NULL,
    feature_mask VARBIT(16)
);

INSERT INTO account_flags (username, permissions, feature_mask) VALUES
('ali', B'10110011', B'1101'),
('sara', B'11100001', B'101011'),
('zain', B'01010101', B'0011');

SELECT
    username,
    permissions,
    permissions & B'00000001' AS can_read_flag,
    permissions | B'00001000' AS with_extra_permission
FROM account_flags
ORDER BY username;

SELECT
    username,
    bit_length(feature_mask) AS feature_mask_bits
FROM account_flags
ORDER BY username;

