CREATE TABLE `users`(
    `id` INT NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `bio` VARCHAR(255) NOT NULL,
    `country` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `users` ADD PRIMARY KEY `users_id_primary`(`id`);
ALTER TABLE
    `users` ADD UNIQUE `users_email_unique`(`email`);
CREATE TABLE `rooms`(
    `id` INT NOT NULL,
    `owner_id` INT NOT NULL,
    `price` INT NOT NULL,
    `hot_tub` TINYINT(1) NOT NULL,
    `home_type` VARCHAR(255) NOT NULL,
    `room_type` VARCHAR(255) NOT NULL,
    `total_occupancy` INT NOT NULL,
    `total_bedrooms` INT NOT NULL,
    `total_bathrooms` INT NOT NULL,
    `summary` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `has_kitchen` TINYINT(1) NOT NULL,
    `has_air_con` TINYINT(1) NOT NULL,
    `has_heating` TINYINT(1) NOT NULL,
    `has_internet` TINYINT(1) NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL,
    `latitude` DOUBLE(8, 2) NOT NULL,
    `longitude` DOUBLE(8, 2) NOT NULL
);
ALTER TABLE
    `rooms` ADD PRIMARY KEY `rooms_id_primary`(`id`);
CREATE TABLE `bookings`(
    `id` INT NOT NULL,
    `guest_id` INT NOT NULL,
    `room_id` INT NOT NULL,
    `start_date` DATETIME NOT NULL,
    `end_date` DATETIME NOT NULL,
    `price` INT NOT NULL,
    `total` INT NOT NULL,
    `created_at` DATETIME NOT NULL,
    `updated_at` DATETIME NOT NULL
);
ALTER TABLE
    `bookings` ADD PRIMARY KEY `bookings_id_primary`(`id`);
ALTER TABLE
    `bookings` ADD CONSTRAINT `bookings_guest_id_foreign` FOREIGN KEY(`guest_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `rooms` ADD CONSTRAINT `rooms_owner_id_foreign` FOREIGN KEY(`owner_id`) REFERENCES `users`(`id`);
ALTER TABLE
    `bookings` ADD CONSTRAINT `bookings_room_id_foreign` FOREIGN KEY(`room_id`) REFERENCES `rooms`(`id`);