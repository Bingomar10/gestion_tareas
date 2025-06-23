/*
 Navicat Premium Data Transfer

 Source Server         : mariaDB
 Source Server Type    : MariaDB
 Source Server Version : 100432
 Source Host           : localhost:3306
 Source Schema         : bd_tareas

 Target Server Type    : MariaDB
 Target Server Version : 100432
 File Encoding         : 65001

 Date: 23/06/2025 09:42:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` tinyint(1) NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin Demo', 'ga19033@demo.com', '$2a$12$T.CWbpfRcHOsB9vGItEN8u3gBkDV43FbSTLA.q6bioYYrduiaZETS', 1, '2025-06-21 13:21:34');
INSERT INTO `users` VALUES (2, 'Irving Aguilar', 'agylar100@gmail.com', '$2a$12$CFVEONY4RZ5t3dNt6BZH3euBgVETCB2QrQk1k7po4JLP6c6KzskbC', 2, '2025-06-21 20:52:37');
INSERT INTO `users` VALUES (3, 'Gustavo Aguilar', 'gustavoga@gmail.com', '$2y$10$EncQfBWWYoiwA0Ei5XB0o.9POXHGWgqPyHaIc7RVkAc7/Z/Z9Glcm', 2, '2025-06-22 10:03:56');
INSERT INTO `users` VALUES (4, 'Omar Aguilar', 'agylar10@gmail.com', '$2y$10$jFB/TMQWPXJUf9W96I8Ht.V/yq2x85F67aDaOT2Fl7/nrYEX5iquC', 1, '2025-06-23 08:19:45');
INSERT INTO `users` VALUES (5, 'Fernando Aguilar', 'fagylar@gmail.com', '$2y$10$.rd94xrwgUwsb2DUbVunOejtVWDshiTDmRvMJlYidN4sdOhsFdaky', 2, '2025-06-23 09:40:37');

-- ----------------------------
-- Table structure for tasks
-- ----------------------------
DROP TABLE IF EXISTS `tasks`;
CREATE TABLE `tasks`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `due_date` date NULL DEFAULT NULL,
  `created_by` int(11) NULL DEFAULT NULL,
  `assigned_to` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NOT NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `created_by`(`created_by`) USING BTREE,
  INDEX `assigned_to`(`assigned_to`) USING BTREE,
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `tasks_ibfk_2` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tasks
-- ----------------------------
INSERT INTO `tasks` VALUES (1, 'Ver listado de productos', 'Crear una tabla para ver el listado de productos activos', '2025-06-23', 1, 2, '2025-06-21 20:59:01');
INSERT INTO `tasks` VALUES (2, 'Crear ver detalle producto', 'Mostrar la información del producto en un card', '2025-06-24', 1, 2, '2025-06-21 22:58:51');
INSERT INTO `tasks` VALUES (3, 'Crear formularios marcas', 'Crear un formulario para ingresar la información sobre las marcas', '2025-06-27', 1, 3, '2025-06-22 22:44:54');
INSERT INTO `tasks` VALUES (4, 'Crear formulario para productos', 'Crear un formulario para registrar la información de los productos', '2025-06-30', 1, 3, '2025-06-22 22:55:10');
INSERT INTO `tasks` VALUES (5, 'Ver detalle de información de proveedores', 'Mostrar la información resumida en un card', '2025-06-24', 1, 2, '2025-06-23 08:54:58');



SET FOREIGN_KEY_CHECKS = 1;
