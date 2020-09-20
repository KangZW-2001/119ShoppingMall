/*
Navicat MySQL Data Transfer

Source Server         : 119_ShoppingMall
Source Server Version : 80021
Source Host           : localhost:3306
Source Database       : 119shoppingmall

Target Server Type    : MYSQL
Target Server Version : 80021
File Encoding         : 65001

Date: 2020-09-20 14:29:36
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cat1
-- ----------------------------
DROP TABLE IF EXISTS `cat1`;
CREATE TABLE `cat1` (
  `cat_one_id` int NOT NULL AUTO_INCREMENT,
  `cat_one_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_one_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cat1
-- ----------------------------
INSERT INTO `cat1` VALUES ('1', '水果');
INSERT INTO `cat1` VALUES ('2', '小零食');
INSERT INTO `cat1` VALUES ('3', '面点素食');
INSERT INTO `cat1` VALUES ('4', '酒水饮料');
INSERT INTO `cat1` VALUES ('5', '日用百货');

-- ----------------------------
-- Table structure for cat2
-- ----------------------------
DROP TABLE IF EXISTS `cat2`;
CREATE TABLE `cat2` (
  `cat_two_id` int NOT NULL,
  `cat_two_name` varchar(255) DEFAULT NULL,
  `cat_image_src` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`cat_two_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of cat2
-- ----------------------------
INSERT INTO `cat2` VALUES ('11', '当季水果', 'c1fruit/c1_1seasonFruit/seasonFruit.png');
INSERT INTO `cat2` VALUES ('12', '新鲜果切', 'c1fruit/c1_2fruitCut/fruitCut.png');
INSERT INTO `cat2` VALUES ('13', '水果捞', 'c1fruit/c1_3fruitTart/fruitTart.png');
INSERT INTO `cat2` VALUES ('14', '奇珍异果', 'c1fruit/c1_4strangeFruit/strangeFruit.png');
INSERT INTO `cat2` VALUES ('21', '薯片', 'c2snack/c2_1chips/chips.png');
INSERT INTO `cat2` VALUES ('22', '雪糕', 'c2snack/c2_2iceCream/iceCream.png');
INSERT INTO `cat2` VALUES ('23', '膨化食品', 'c2snack/c2_3puffedFood/puffedFood.png');
INSERT INTO `cat2` VALUES ('24', '火腿肠', 'c2snack/c2_4hamSausage/hamSausage.png');
INSERT INTO `cat2` VALUES ('25', '月饼', 'c2snack/c2_5moonCake/moonCake.png');
INSERT INTO `cat2` VALUES ('31', '饼干', 'c3fastFood/c3_1biscuit/biscuit.png');
INSERT INTO `cat2` VALUES ('32', '方便面', 'c3fastFood/c3_2instantNoodles/instantNoodles.png');
INSERT INTO `cat2` VALUES ('33', '面包', 'c3fastFood/c3_3bread/bread.png');
INSERT INTO `cat2` VALUES ('34', '自热小火锅', 'c3fastFood/c3_4autoHot/autoHot.png');
INSERT INTO `cat2` VALUES ('41', '啤酒', 'c4drink/c4_1beer/beer.jpg');
INSERT INTO `cat2` VALUES ('42', '果汁', 'c4drink/c4_2juice/juice.png');
INSERT INTO `cat2` VALUES ('43', '碳酸饮料', 'c4drink/c4_3cola/cola.png');
INSERT INTO `cat2` VALUES ('44', '白酒', 'c4drink/c4_4whiteWine/whiteWine.jpg');
INSERT INTO `cat2` VALUES ('45', '奶类', 'c4drink/c4_5milk/milk.png');
INSERT INTO `cat2` VALUES ('51', '文具', 'c5dailyGood/c5_1stationery/stationery.png');
INSERT INTO `cat2` VALUES ('52', '工具', 'c5dailyGood/c5_2workTool/workTool.jpg');
INSERT INTO `cat2` VALUES ('53', '小型电器', 'c5dailyGood/c5_3miniEle/miniEle.png');

-- ----------------------------
-- Table structure for form
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form` (
  `form_id` int NOT NULL,
  `form_address` varchar(255) DEFAULT NULL,
  `form_price` int DEFAULT NULL,
  `form_state` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `form_date` varchar(255) DEFAULT NULL,
  `form_num` int DEFAULT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of form
-- ----------------------------
INSERT INTO `form` VALUES ('1', null, '228', '2', '1', null, '2');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `good_id` int NOT NULL AUTO_INCREMENT,
  `good_add_time` datetime DEFAULT NULL,
  `good_comment` varchar(255) DEFAULT NULL,
  `good_introduce` varchar(255) DEFAULT NULL,
  `good_is_discut` int DEFAULT NULL,
  `good_is_group_buy` int DEFAULT NULL,
  `good_name` varchar(255) DEFAULT NULL,
  `good_pics` varchar(255) DEFAULT NULL,
  `good_price` int DEFAULT NULL,
  `good_reserve` int DEFAULT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '2020-09-14 15:56:40', '没有评论', '富士苹果的特点是体积很大，遍体通红，形状很圆，平均大小如棒球一般。果实的重量中，有9－11%是单糖，而且其果肉紧密，比其他很多苹果变种都要甜美和清脆，因此受到全世界消费者的广泛喜爱。富士苹果与其他苹果相比有更长的最佳食用日期，甚至无需放入冰箱保存。室温下即可保存较长时间。如果将苹果在5%的盐水中浸泡10分钟，晾干，装入保鲜袋，密封后放入冰箱，温度控制在0～40℃，可保存5个月以上。', '10', '1', '红富士苹果水果新鲜10山东烟台栖霞脆甜一级礼盒斤装当季整箱包邮', 'c1fruit/c1_1seasonFruit/apple/apple1.png,c1fruit/c1_1seasonFruit/apple/apple2.png,c1fruit/c1_1seasonFruit/apple/apple3.png,c1fruit/c1_1seasonFruit/apple/apple4.png,c1fruit/c1_1seasonFruit/apple/apple5.png', '99', '100');
INSERT INTO `good` VALUES ('2', '2020-09-14 15:57:32', '没有评论', '香蕉属高热量水果，在一些热带地区香蕉还作为主要粮食。香蕉果肉营养价值颇高，此外，还含多种微量元素和维生素。其中维生素A能促进生长，增强对疾病的抵抗力，是维持正常的生殖力和视力所必需；硫胺素能抗脚气病，促进食欲、助消化，保护神经系统；核黄素能促进人体正常生长和发育。香蕉除了能平稳血清素和褪黑素外，它还含有可具有让肌肉松弛效果的镁元素，经常工作压力比较大的朋友可以多食用。香蕉果肉香甜软滑，是人们喜爱的水果之一。欧洲人因为它能解除忧郁而称它为“快乐水果”，在香蕉的基础上还出现了创意文化水果，帮人创造开心。', '5', '0', '广西香蕉新鲜小米蕉水果包邮香焦小香蕉10斤自然熟当季整箱批发', 'c1fruit/c1_1seasonFruit/banana/banana1.png,c1fruit/c1_1seasonFruit/banana/banana2.png,c1fruit/c1_1seasonFruit/banana/banana3.png,c1fruit/c1_1seasonFruit/banana/banana4.png', '129', '100');
INSERT INTO `good` VALUES ('3', '2020-09-14 15:58:05', '没有评论', '橘子中的维生素A还能够增强人体在黑暗环境中的视力和治疗夜盲症。橘子不宜食用过量，吃太多会患有胡萝卜素血症，皮肤呈深黄色，如同黄疸一般。若因吃太多橘子造成手掌变黄，只要停吃一段时间，就能让肤色渐渐恢复正常。明代张岱季叔张烨芳对橘子情有独钟，据载其“性好啖橘，橘熟，堆砌床案间，无非橘者，自刊不给，辄命数僮环立剥之”，吃到手脚都呈现黄色。', '8', '1', '陕西周至翠香猕猴桃纯甜/绿心奇异果应季水果新鲜当季整箱5斤礼盒', 'c1fruit/c1_1seasonFruit/kiwiFruit/kiwiFruit1.png,c1fruit/c1_1seasonFruit/kiwiFruit/kiwiFruit2.png,c1fruit/c1_1seasonFruit/kiwiFruit/kiwiFruit3.png,c1fruit/c1_1seasonFruit/kiwiFruit/kiwiFruit4.png,c1fruit/c1_1seasonFruit/kiwiFruit/kiwiFruit5.png', '48', '100');
INSERT INTO `good` VALUES ('4', '2020-09-14 16:00:48', '没有评论', '猕猴桃除含有猕猴桃碱、蛋白水解酶、单宁果胶和糖类等有机物，以及钙、钾、硒、锌、锗等微量元素和人体所需17种氨基酸外，还含有丰富的维生素C、葡萄酸、果糖、柠檬酸、苹果酸、脂肪。\r\n猕猴桃含有丰富的矿物质，包括丰富的钙、磷、铁，还含有胡萝卜素和多种维生素，对保持人体健康具有重要的作用。被誉为“水果之王”的猕猴桃酸甜可口，营养丰富，是老年人、儿童、体弱多病者的滋补果品。', '5', '0', '陕西周至翠香猕猴桃纯甜/绿心奇异果应季水果新鲜当季整箱5斤礼盒', 'c1fruit/c1_1seasonFruit/orange/orange1.png,c1fruit/c1_1seasonFruit/orange/orange2.png,c1fruit/c1_1seasonFruit/orange/orange3.png,c1fruit/c1_1seasonFruit/orange/orange4.png,c1fruit/c1_1seasonFruit/orange/orange5.png,', '96', '100');
INSERT INTO `good` VALUES ('5', '2020-09-14 16:01:21', '没有评论', '从越南进口的红心火龙果，当天进货，十分新鲜，欢迎大家下单。火龙果是热带水果，最好现买现吃。在5℃-9℃的低温中，新鲜摘下的火龙果不经挤压碰撞，保存期可超过一个月。在25℃-30℃的室温状态下，保质期可超过2个星期。 火龙果不仅味道香甜，还具有很高的营养价值，它集于水果、花蕾、蔬菜、医药优点于一身。不但营养丰富、功能独特，很少有病虫害，几乎不使用任何农药都可以正常生长。', '6', '0', '甘福园 越南红心火龙果5斤新鲜当季水果大红肉10应季批发整箱包邮', 'c1fruit/c1_1seasonFruit/pitaya/pitaya1.png,c1fruit/c1_1seasonFruit/pitaya/pitaya2.png,c1fruit/c1_1seasonFruit/pitaya/pitaya3.png,c1fruit/c1_1seasonFruit/pitaya/pitaya4.png,c1fruit/c1_1seasonFruit/pitaya/pitaya5.png,', '119', '100');
INSERT INTO `good` VALUES ('6', '2020-09-14 16:01:57', '没有评论', '产品描述：采用新鲜水果，当前切4小时内出售，保证新鲜，保证好吃，实惠。果切内含西瓜，草莓，樱桃，哈密瓜，火龙果等新鲜水果（不同天水果品种略有差异，但总价值恒定）', '5', '1', '单种果切', 'c1fruit/c1_2fruitCut/singleFruitCut/singleFruitCut1.png,c1fruit/c1_2fruitCut/singleFruitCut/singleFruitCut2.png,c1fruit/c1_2fruitCut/singleFruitCut/singleFruitCut3.png', '6', '100');
INSERT INTO `good` VALUES ('7', '2020-09-15 15:02:22', '这是一个测试', '果切采用优质水果制作，保质保量。', '6', '0', '混合果切', 'c1fruit/c1_2fruitCut/varietyFruitCut/varietyFruitCut1.png,c1fruit/c1_2fruitCut/varietyFruitCut/varietyFruitCut2.png', '10', '100');
INSERT INTO `good` VALUES ('8', '2020-09-15 15:03:05', '这是一个测试', '水果捞采用优质酸奶制作，保证口感。在常规水果捞的基础上增加燕麦片，可以代餐', '5', '0', '燕麦水果捞', 'c1fruit/c1_3fruitTart/oatsFruitTart/oatsFruitTart1.png,c1fruit/c1_3fruitTart/oatsFruitTart/oatsFruitTart2.png,c1fruit/c1_3fruitTart/oatsFruitTart/oatsFruitTart3.png', '20', '100');
INSERT INTO `good` VALUES ('9', '2020-09-16 14:09:00', '无', '水果捞采用优质酸奶制作，保证口感。选用新鲜水果与优质酸奶混合而成，新鲜健康又美味。低卡代餐产品的首选。', '5', '0', '普通水果捞', 'c1fruit/c1_3fruitTart/regularFruitTart/regularFruitTart1.png,c1fruit/c1_3fruitTart/regularFruitTart/regularFruitTart2.png,c1fruit/c1_3fruitTart/regularFruitTart/regularFruitTart3.png', '10', '100');
INSERT INTO `good` VALUES ('10', '2020-09-16 14:10:34', '无', '水果捞采用优质酸奶制作，保证口感。常规水果捞的基础上，我们精选了当季的桑葚加入。喜欢吃桑葚的宝宝请尽快下单呦～～～', '6', '0', '当季水果捞', 'c1fruit/c1_3fruitTart/seasonFruitTart/seasonFruitTart1.png,c1fruit/c1_3fruitTart/seasonFruitTart/seasonFruitTart2.png', '10', '100');
INSERT INTO `good` VALUES ('11', '2020-09-16 14:10:37', '无', '：车厘子，别名又叫大樱桃、含桃、荆桃等，是上市最早的一种乔木果实，号称“百果第一枝”。据说黄莺特别喜好啄食这种果子，因而又名为“莺桃”。其果实虽小如珍珠，但色泽红艳光洁，玲珑如玛瑙宝石一般，味道甘甜其中带有一丝酸味，既可鲜食，又可腌制或作为其他菜肴食品的点缀，尽管价格微贵，但是倍受青睐。', '7', '0', '美国车厘子进口新鲜水果非智利黑珍珠加拿大9R大果大樱桃现货', 'c1fruit/c1_4strangeFruit/cherries/cherries1.png,c1fruit/c1_4strangeFruit/cherries/cherries2.png,c1fruit/c1_4strangeFruit/cherries/cherries3.png,c1fruit/c1_4strangeFruit/cherries/cherries4.png,c1fruit/c1_4strangeFruit/cherries/cherries5.png', '276', '100');
INSERT INTO `good` VALUES ('12', '2020-09-16 14:10:39', '无', '榴莲（学名：Durio zibethinus Murr ），是一种锦葵目、木棉科巨型的热带常绿乔木，叶片长圆，顶端较尖，聚伞花序，花色淡黄，果实足球大小，果皮坚实，密生三角形刺，果肉是由假种皮的肉包组成，肉色淡黄，粘性多汁是一种极具经济价值的水果。榴莲是热带著名水果之一，原产马来西亚。东南亚一些国家种植较多， 其中以泰国最多。中国广东﹑海南也有种植。', '7', '0', '泰国金枕榴莲新鲜带壳榴莲应季水果现摘金枕头榴莲包邮进口水果', 'c1fruit/c1_4strangeFruit/durian/durian1.png,c1fruit/c1_4strangeFruit/durian/durian2.png,c1fruit/c1_4strangeFruit/durian/durian3.png,c1fruit/c1_4strangeFruit/durian/durian4.png,c1fruit/c1_4strangeFruit/durian/durian5.png', '258', '100');
INSERT INTO `good` VALUES ('13', '2020-09-16 14:25:13', '无', '创新永远是最鲜活的生产力，对于薯片也是一样。所以，乐事的口味创新一直在进行。基于中国人的口味偏好，乐事除了推出众多肉类口味，例如：德克萨斯烧烤味、墨西哥鸡汁番茄味、意大利香浓红烩味，还有创新的海鲜系列口味、清新清爽系列、深受消费者喜爱的番茄口味等，以满足广大消费者的多元化喜好。', '7', '0', '乐事薯片零食大礼包食品一箱超大包休闲小吃整箱装大波浪官方旗舰', 'c2snack/c2_1chips/leshiChips/leshiChips1.png,c2snack/c2_1chips/leshiChips/leshiChips2.png,c2snack/c2_1chips/leshiChips/leshiChips3.png,c2snack/c2_1chips/leshiChips/leshiChips4.png,c2snack/c2_1chips/leshiChips/leshiChips5.png', '35', '100');
INSERT INTO `good` VALUES ('14', '2020-09-16 14:25:16', '无', '创新永远是最鲜活的生产力，对于薯片也是一样。所以，乐事的口味创新一直在进行。基于中国人的口味偏好，乐事除了推出众多肉类口味，例如：德克萨斯烧烤味、墨西哥鸡汁番茄味、意大利香浓红烩味，还有创新的海鲜系列口味、清新清爽系列、深受消费者喜爱的番茄口味等，以满足广大消费者的多元化喜好。', '7', '0', '乐事山药薄片80g*5袋装苦荞青稞山药脆卷脆片薯片零食品小吃包邮', 'c2snack/c2_1chips/leshishanyaopianChips/leshishanyaopianChips1.png,c2snack/c2_1chips/leshishanyaopianChips/leshishanyaopianChips2.png,c2snack/c2_1chips/leshishanyaopianChips/leshishanyaopianChips3.png', '60', '100');
INSERT INTO `good` VALUES ('15', '2020-09-16 14:25:18', '无', '“好丽友·薯愿”是韩国食品企业好丽友出品的非油炸薯片。口味包括红酒牛排味、香烤原味、香焗番茄味、烤鸡沙拉味、蜂蜜牛奶味。成分则含有 马铃薯、氢化植物油、增稠剂、乳化剂、膨松剂、白砂糖、淀粉、全脂乳粉、玉米粉、食用盐等。\r\n\r\n“好丽友·薯愿”是韩国食品企业好丽友出品的非油炸薯片。口味包括红酒牛排味、香烤原味、香焗番茄味、烤鸡沙拉味、蜂蜜牛奶味。成分则含有 马铃薯、氢化植物油、增稠剂、乳化剂、膨松剂、白砂糖、淀粉、全脂乳粉、玉米粉、食用盐等。\r\n\r\n', '7', '0', '好丽友薯愿薯片104g*6盒黄瓜味蜂蜜牛奶味薯条小包装膨化休闲零食', 'c2snack/c2_1chips/shuyuanChips/shuyuanChips1.png,c2snack/c2_1chips/shuyuanChips/shuyuanChips12.png,c2snack/c2_1chips/shuyuanChips/shuyuanChips3.png,c2snack/c2_1chips/shuyuanChips/shuyuanChips4.png,c2snack/c2_1chips/shuyuanChips/shuyuanChips5.png', '40', '100');
INSERT INTO `good` VALUES ('16', '2020-09-16 14:25:21', '无', '光明白雪冰砖中华老字号儿时的回忆奶香浓郁口感浓醇，浓的的奶香,香甜软糯的口感,炎炎夏日,吃上一块,真的会觉得特别的幸福,嗯,是甜蜜幸福的味道。', '7', '0', '光明白雪中砖冰淇淋香草味冰淇淋雪糕盒装冰激凌老式冰棍雪糕批发', 'c2snack/c2_2iceCream/guangming/guangming1.png,c2snack/c2_2iceCream/guangming/guangming2.png,c2snack/c2_2iceCream/guangming/guangming3.png,c2snack/c2_2iceCream/guangming/guangming4.png,c2snack/c2_2iceCream/guangming/guangming5.png', '99', '100');
INSERT INTO `good` VALUES ('17', '2020-09-16 14:25:24', '无', '伊利冰淇淋经典产品，结构丰富，在香脆的巧克力脆皮下夹有香草口味雪糕，里层的巧克力棒内更有香脆的阿华田脆饼。', '7', '0', '巧乐兹经典冰淇淋', 'c2snack/c2_2iceCream/qiaoleziclassic/qiaoleziclassic1.png,c2snack/c2_2iceCream/qiaoleziclassic/qiaoleziclassic2.png,c2snack/c2_2iceCream/qiaoleziclassic/qiaoleziclassic3.png,c2snack/c2_2iceCream/qiaoleziclassic/qiaoleziclassic4.png', '10', '100');
INSERT INTO `good` VALUES ('18', '2020-09-16 14:25:27', '无', '伊利冰淇淋经典产品，结构丰富，在香脆的巧克力脆皮下夹有香草口味雪糕，里层的巧克力棒内更有香脆的阿华田脆饼。', '7', '0', '巧乐兹冰淇淋', 'c2snack/c2_2iceCream/qiaoleziIcecream/qiaoleziIcecream1.png,c2snack/c2_2iceCream/qiaoleziIcecream/qiaoleziIcecream2.png,c2snack/c2_2iceCream/qiaoleziIcecream/qiaoleziIcecream3.png,c2snack/c2_2iceCream/qiaoleziIcecream/qiaoleziIcecream4.png', '10', '100');
INSERT INTO `good` VALUES ('19', '2020-09-16 14:25:30', '无', '咬上一口，冰淇淋细腻绵密，浓浓的奶味瞬间弥漫口腔，比旺仔牛奶的奶味还要更浓一些哦！另外一款红豆味的也很优秀，口味就是红豆沙本沙哇！偏沙冰的质地，有那么点红豆冰的意思了呢！操作很简单，冻痴上部有拉环，轻轻打开一拉，就可以直接吃啦！', '7', '0', '旺仔冰淇淋', 'c2snack/c2_2iceCream/wangzai/wangzai1.png,c2snack/c2_2iceCream/wangzai/wangzai2.png,c2snack/c2_2iceCream/wangzai/wangzai3.png', '10', '100');
INSERT INTO `good` VALUES ('20', '2020-09-16 14:25:34', '无', '经典怀旧零食 儿时味道 琥珀休闲膨化小米锅巴牛肉味 潮汕特产怀旧零食品小吃 小米锅巴 怡口香五香孜然麻辣牛肉味小袋包装休闲膨化怀旧零食。 源自台湾，唇齿留香，健康好搭档。精选小麦粉，纯正浓厚。上等棕榈油，滴滴香浓。', '7', '0', '琥珀小米锅巴手工麻辣味60袋小包装休闲膨化食品小吃小零食大礼包', 'c2snack/c2_3puffedFood/riceCrust/riceCrust1.png,c2snack/c2_3puffedFood/riceCrust/riceCrust2.png,c2snack/c2_3puffedFood/riceCrust/riceCrust3.png,c2snack/c2_3puffedFood/riceCrust/riceCrust4.png,c2snack/c2_3puffedFood/riceCrust/riceCrust5.png', '20', '100');
INSERT INTO `good` VALUES ('21', '2020-09-16 14:25:36', '无', '虾片又称2113玉片，传统生产方法是用虾汁加淀粉制5261成的，不属于传统意义上4102的海鲜，是属于海鲜的1653延伸产品。如用马铃薯制作虾片，产品有其独特之处，也很受人们欢迎。马铃薯制作虾片的方法有两种，一种是用马铃薯全粉代替10--20%淀粉，制作过程与传统方法相同', '7', '0', '上好佳鲜虾片薯片虾条整箱大礼包儿童吃货零食小吃休闲食品超大包', 'c2snack/c2_3puffedFood/xiatiao/xiatiao1.png,c2snack/c2_3puffedFood/xiatiao/xiatiao2.png,c2snack/c2_3puffedFood/xiatiao/xiatiao3.png,c2snack/c2_3puffedFood/xiatiao/xiatiao4.png,c2snack/c2_3puffedFood/xiatiao/xiatiao5.png', '26', '100');
INSERT INTO `good` VALUES ('22', '2020-09-16 14:25:38', '无', '好丽友呀土豆番茄给你带来的营养和美妙的口感，口感更加饱满丰富，别有一番滋味。', '7', '0', '好丽友呀土豆番茄酱味70g休闲膨化零食出游薯片新老包装随机发放', 'c2snack/c2_3puffedFood/yapotato/yapotato1.png,c2snack/c2_3puffedFood/yapotato/yapotato2.png,c2snack/c2_3puffedFood/yapotato/yapotato3.png,c2snack/c2_3puffedFood/yapotato/yapotato4.png,c2snack/c2_3puffedFood/yapotato/yapotato5.png', '6', '100');
INSERT INTO `good` VALUES ('23', '2020-09-16 14:25:40', '无', '以精制火腿、汉堡火腿等为代表的高温火腿系列；以三明治火腿、香菇火腿、牛肉方腿、啤酒火腿、烟熏里脊、熏烤牛肉、熏烤圆火腿为代表的西式肉制品系列；以台式香肠、麻辣香肠、原味香肠、波兰熏香肠、哈尔滨香肠、上海大红肠、蒜蓉大红肠、啤酒肠为代表的低温灌肠系列', '7', '0', '双汇王中王火腿肠30g*8支香肠肉类休闲零食速食配泡面网红零食', 'c2snack/c2_4hamSausage/shuanghui/shuanghui1.png,c2snack/c2_4hamSausage/shuanghui/shuanghui2.png,c2snack/c2_4hamSausage/shuanghui/shuanghui3.png,c2snack/c2_4hamSausage/shuanghui/shuanghui4.png,c2snack/c2_4hamSausage/shuanghui/shuanghui5.png', '14', '100');
INSERT INTO `good` VALUES ('24', '2020-09-16 14:25:43', '无', '深受香港及大陆同胞欢迎的香港美心月饼，一直以严选食材及香港制造驰名。除了数十年来皆专注于月饼制作外，其所选用的食材全部是顶级之选。此款美心 流心奶黄月饼礼盒，浓滑的奶黄夹着甘沙咸的蛋黄，由内而外的甘香幼滑，皮薄松化，馅料幼滑，一口咬下去，奶黄由心流出', '7', '0', '中国香港美心流心奶黄月饼礼盒360g港式广式糕点流沙蛋黄中秋送礼', 'c2snack/c2_5moonCake/tjumoonCake/tjumoonCake1.png,c2snack/c2_5moonCake/tjumoonCake/tjumoonCake2.png,c2snack/c2_5moonCake/tjumoonCake/tjumoonCake3.png,c2snack/c2_5moonCake/tjumoonCake/tjumoonCake4.png,c2snack/c2_5moonCake/tjumoonCake/tjumoonCake5.png', '520', '100');
INSERT INTO `good` VALUES ('25', '2020-09-16 15:30:21', '无', '是由天津雀巢有限公司制造出产的一款威化巧克力食品。该商品是由代可可脂牛奶巧克力（白砂糖，代可可脂，脱脂奶粉（≥4.5%），可可粉，大豆磷脂，食用香精，聚甘油蓖麻醇酯），小麦粉（≥31%），白砂糖，氢化植物油，红小豆粉，麦芽糊精，植物油，食品添加剂等组成。', '7', '0', '雀巢脆脆鲨巧克力威化饼干食品24+8条网红休闲怀旧解馋零食盒装 ', 'c3fastFood/c3_1biscuit/Nestle/Nestle1.png,c3fastFood/c3_1biscuit/Nestle/Nestle2.png', '49', '100');
INSERT INTO `good` VALUES ('26', '2020-09-16 15:48:05', '无', '奥利奥（Oreo）是卡夫食品旗下的巧克力夹心饼干，诞生于1912年，有香草慕斯、巧克力、柠檬芝士蛋糕等多种口味。现在，它已经像篮球和可乐一样成为了美国文化的一部分，并被誉为饼干之王。奥利奥饼干独有的黑白夹心、精雕细刻，风行全世界，使人一见难忘。', '7', '0', '奥利奥夹心饼干巧克力味696g/盒休闲食品网红零食小包装超值12袋', 'c3fastFood/c3_1biscuit/oreo/oreo1.png,c3fastFood/c3_1biscuit/oreo/oreo2.png,c3fastFood/c3_1biscuit/oreo/oreo3.png', '45', '110');
INSERT INTO `good` VALUES ('27', '2020-09-16 15:48:07', '无', '今麦郎红烧牛肉面是市场上一种比较广泛的方便面，买的人很多，一方面的愿意是大家也非常的相信这个牌子，一方面的原因也是因为这个方便面很便宜。', '7', '0', '今麦郎一袋半红烧牛肉面141g*5连包方便面拌炒面泡面大食袋多半包', 'c3fastFood/c3_2instantNoodles/jinmailang/jinmailang1.png,c3fastFood/c3_2instantNoodles/jinmailang/jinmailang2.png,c3fastFood/c3_2instantNoodles/jinmailang/jinmailang3.png', '15', '110');
INSERT INTO `good` VALUES ('28', '2020-09-16 15:48:09', '无', '康师傅方便面一直坚持以真材实料为基础，并特别关注各地消费者不同口味变化及需求。以\"康师傅\"系列产品为首，现已经延伸到： “面霸120”、“料珍多”、“新面族”、“巧玲珑”、“劲拉面”、“亚洲精选”、“福满多”、 “好滋味”、“小虎队”、“挂面”、“脆旋风”、“脆宽趣”、“珍品”、“劲爽”等多种系列产品，满足各类消费阶层的需求。商品特点：延续康师傅口味的丰富配料与口碑，在杯面上做轻巧呈现；小量浅嚐，搭配实在的价格，是您点心、宵夜、嘴馋时的最佳选择。', '7', '0', '康师傅方便面食品大食袋红烧牛肉面120g*5袋装泡面速食面即食面', 'c3fastFood/c3_2instantNoodles/kangshifu/kangshifu1.png,c3fastFood/c3_2instantNoodles/kangshifu/kangshifu2.png', '15', '110');
INSERT INTO `good` VALUES ('29', '2020-09-16 15:48:12', '无', '统一汤达人是统一集团旗下一种高品质的方便面，已推出日式豚骨拉面、酸酸辣辣豚骨拉面、海鲜口味汤面、罗宋汤面、味增拉面、辣牛肉汤面及椰汁鸡汤面七个口味。汤达人日式豚骨拉面的汤无可挑剔了，非常的鲜美，精选了新鲜牛骨，鸡骨，研碎后经长时间炖煮熬成浓香四溢的汤，营养非常丰富，碗装的里面还有两大片肉，口感非常好。', '7', '0', '统一生活面 汤达人罗宋汤面 90g/杯 方便面杯面泡面 好面汤决定', 'c3fastFood/c3_2instantNoodles/tangdaren/tangdaren1.png,c3fastFood/c3_2instantNoodles/tangdaren/tangdaren2.png,c3fastFood/c3_2instantNoodles/tangdaren/tangdaren3.png', '5', '110');
INSERT INTO `good` VALUES ('30', '2020-09-16 15:48:13', '无', '良品铺子始终如一地把产品安全和品质作为企业发展的生命线。“粒粒皆珍品”是良品铺子产品战略的最高追求！“六层品质把关，好吃安全放心”是良品铺子对消费者的庄严承诺！良品铺子的每一件产品都是严格按照“六层品质把关”产品质量体系进行生产制作、物流配送和上柜的。“六层品质把关”包括：①生产商甄选；②原料精选；③口味定制；④生产过程监控；⑤快捷物流保新鲜；⑥上柜前质检等环节。', '7', '0', '良品铺子零食大礼包肉食类卤味一箱零食鸭舌鸭肉鸭脖中秋礼品礼盒', 'c3fastFood/c3_3bread/liangpinpuzi/liangpinpuzi1.png,c3fastFood/c3_3bread/liangpinpuzi/liangpinpuzi2.png,c3fastFood/c3_3bread/liangpinpuzi/liangpinpuzi3.png', '89', '110');
INSERT INTO `good` VALUES ('31', '2020-09-16 15:48:15', '无', '层出不穷的绵密口感，撕出来的鲜香诱惑，浓郁奶香融合清新麦香，缠绵口感交叠着鲜甜，配料有：新鲜鸡蛋，新西兰进口乳粉，生态小麦等。采用：多层包酥工艺，低温冷冻技术，150分钟慢发酵，智能隧道炉烘焙。', '7', '0', '盼盼手撕面包整箱2斤/箱 礼盒 早餐营养西式糕点蛋糕休闲零食', 'c3fastFood/c3_3bread/panpan/panpan1.png,c3fastFood/c3_3bread/panpan/panpan2.png,c3fastFood/c3_3bread/panpan/panpan3.png,c3fastFood/c3_3bread/panpan/panpan4.png', '30', '110');
INSERT INTO `good` VALUES ('32', '2020-09-16 21:39:50', '无', '碧根果：全世界17种山核桃之一，属纯野生果类，是集山地之灵气哺育而成。 无任何公害污染的天然绿色食品。夏威夷果：又名“澳洲坚果”，被认为是世界上最好的桌上坚果之一。 果仁香酥滑嫩可口，有独特的奶油香味，是世界上品质最佳的食用用果。吊瓜子：本名栝楼籽。吊瓜籽粒大肉多，含丰富的不饱和脂肪酸、蛋白质和多种氨基酸和微量元素，是食用瓜中的上品。\r\n\r\n', '7', '0', '三只松鼠轻格华夫饼750g整箱早餐饼干面包食品网红零食营养糕点心', 'c3fastFood/c3_3bread/threesQuarrel/threesQuarrel1.png,c3fastFood/c3_3bread/threesQuarrel/threesQuarrel2.png,c3fastFood/c3_3bread/threesQuarrel/threesQuarrel3.png,c3fastFood/c3_3bread/threesQuarrel/threesQuarrel4.png', '50', '100');
INSERT INTO `good` VALUES ('33', '2020-09-16 21:39:52', '无', '很辣，偏麻，整个蔬菜包里面的蔬菜还是很丰富的，有土豆、藕片、木耳、海带、笋。肉就只有午餐肉，味道符合大众对自热火锅的期望，当然这个味道永远是不能跟实体店火锅的味道比较的。', '7', '0', '海底捞自热小火锅', 'c3fastFood/c3_4autoHot/haidilao/haidilao1.png,c3fastFood/c3_4autoHot/haidilao/haidilao2.png,c3fastFood/c3_4autoHot/haidilao/haidilao3.png,c3fastFood/c3_4autoHot/haidilao/haidilao4.png', '40', '100');
INSERT INTO `good` VALUES ('34', '2020-09-16 21:39:55', '无', '很辣，偏麻，整个蔬菜包里面的蔬菜还是很丰富的，有土豆、藕片、木耳、海带、笋。肉就只有午餐肉，味道符合大众对自热火锅的期望，当然这个味道永远是不能跟实体店火锅的味道比较的。', '7', '0', '三全自热小火锅', 'c3fastFood/c3_4autoHot/sanquan/sanquan1.png,c3fastFood/c3_4autoHot/sanquan/sanquan2.png,c3fastFood/c3_4autoHot/sanquan/sanquan3.png,c3fastFood/c3_4autoHot/sanquan/sanquan4.png', '30', '100');
INSERT INTO `good` VALUES ('35', '2020-09-16 21:39:59', '无', '很辣，偏麻，整个蔬菜包里面的蔬菜还是很丰富的，有土豆、藕片、木耳、海带、笋。肉就只有午餐肉，味道符合大众对自热火锅的期望，当然这个味道永远是不能跟实体店火锅的味道比较的。\r\n\r\n', '7', '0', '小龙坎自热小火锅', 'c3fastFood/c3_4autoHot/xaiolongkan/xaiolongkan1.png,c3fastFood/c3_4autoHot/xaiolongkan/xaiolongkan2.png,c3fastFood/c3_4autoHot/xaiolongkan/xaiolongkan3.png,c3fastFood/c3_4autoHot/xaiolongkan/xaiolongkan4.png', '60', '100');
INSERT INTO `good` VALUES ('36', '2020-09-16 21:40:01', '无', '百威啤酒是从1876年开始投放市场的。安豪泽-布施公司，采用世界独一无二的榉木酢工艺，从选料、糖化、发酵、过滤、直到罐装的每一个工序。生产出来的百威牌啤酒具有格外清澈、格外清爽、格外清醇之品质.素有“啤酒王”之称的百威啤酒成分有5种：质量好的大麦、米、酵母、水和啤酒花。它采用质量最佳的纯天然 材料，以严谨的工艺控制，通过自然发酵，低温储藏而酿成。整个生产流程中不使用任何人造成份、添加剂或防腐剂。在发酵过程中，又使用数百年传统的山毛榉木发酵工艺，使啤酒格外清爽。', '7', '0', '百威啤酒经典美式拉格600ml*12瓶整箱礼盒装套装瓶装', 'c4drink/c4_1beer/baiWei/baiWei1.jpg,c4drink/c4_1beer/baiWei/baiWei2.jpg', '58', '100');
INSERT INTO `good` VALUES ('37', '2020-09-16 21:40:04', '无', '啤酒界的“老干妈”.全国各地都有它的足迹，是国内辨识度最高的一款啤酒。现如今，其代表的已不仅仅是啤酒本身，更是成为了青岛这座城市的荣光。口味很醇厚，有点慕尼黑啤酒的味道，口感很好，麦香很匀称 没有较强的苦涩感 。', '7', '0', '青岛啤酒 小麦白啤500ml*12听整箱全麦酿造口感醇正新鲜正品', 'c4drink/c4_1beer/qingDao/qingDao3.jpg,c4drink/c4_1beer/qingDao/qingDao4.jpg', '109', '100');
INSERT INTO `good` VALUES ('38', '2020-09-16 22:15:44', '无', '此啤酒因其泡沫丰富洁白如雪,口味持久溢香似花,遂命名为“雪花啤酒”,有着非常丰富的泡沫，而且口感也比较大众化，炎热的夏天喝最棒了。', '7', '0', '雪花啤酒勇闯天涯拉罐 500ml*12听整箱 听装新鲜冰爽罐装清爽铝瓶', 'c4drink/c4_1beer/xueHua/xueHua1.jpg,static/c4drink/c4_1beer/xueHua/xueHua2.jpg,static/c4drink/c4_1beer/xueHua/xueHua3.jpg,static/c4drink/c4_1beer/xueHua/xueHua4.jpg', '79', '100');
INSERT INTO `good` VALUES ('39', '2020-09-16 22:15:59', '无', '燕京啤酒采用纯天然矿泉水酿造（国家四部委认证），锶含量高，饮后回味有泉水般的甘甜;现代化啤酒制作装备：溶解氧控制最好、PO值控制最好、燕京啤酒总部为亚洲最大的啤酒生产厂、代表中国啤酒业装备的最高水平；优质酵母菌种：典型高发酵度、苦味代谢柔和，1990、1995行业评酒标准；保鲜期长达4个月：保存4个月的酒和刚下线的一样新鲜，达到国际最高水平。 通过中国绿色食品发展中心审核，符合绿色食品A级标准。\r\n\r\n', '7', '0', '燕京啤酒12度原浆白啤啤酒500ml*15听浓郁丁香花中箱啤酒整箱', 'c4drink/c4_1beer/yanJing/yanJing1.jpg,c4drink/c4_1beer/yanJing/yanJing2.jpg', '200', '100');
INSERT INTO `good` VALUES ('40', '2020-09-16 22:16:02', '无', '：商品名称：优珍苹果醋 商品编号：1949813 商品毛重：7.94kg 商品产地：河南省新乡市是否添加糖：添加糖规格：601-999mL类别：苹果汁包装：整箱装\r\n苹果醋，是指以苹果汁经发酵而成的醋、再兑以苹果汁等原料而成的饮品。并不是厨房里的调味品。苹果', '7', '0', '苹果醋260ml*15整箱100%苹果发酵果汁饮料宴会必备', 'c4drink/c4_2juice/appleJuice/appleJuice1.jpg,c4drink/c4_2juice/appleJuice/appleJuice2.jpg', '90', '100');
INSERT INTO `good` VALUES ('41', '2020-09-16 22:16:04', '无', '商品编号：4983908商品毛重：6.17kg商品产地：北京市\r\n是否添加糖：添加糖规格：400mL以下包装：罐装酸梅汤是传统的消暑饮料，制作原料主要有乌梅、山楂、陈皮、桂花、甘草、冰糖等材料。需要特别提出的是，正宗酸梅汤一定是用冰糖熬制的。乌梅、山楂消油解腻、开胃健脾，梅汤口感好，更避免了让饮用者摄入过多糖分。\r\n', '7', '0', '康师傅传世清饮酸梅汤酸梅汁500ml*15瓶整箱清爽解腻聚会夏日清饮', 'c4drink/c4_2juice/darkPlumJuice/darkPlumJuice1.jpg,c4drink/c4_2juice/darkPlumJuice/darkPlumJuice2.jpg', '53', '100');
INSERT INTO `good` VALUES ('42', '2020-09-16 22:16:09', '无', '葡萄汁顾名思义是由葡萄果肉榨出的果汁。葡萄含有0.5%的植物纤维以及氯化钾、铁和磷等，制成的葡萄汁还含有大量易于消化和吸收的糖分，碳水化合物含量高达16%，其中大部分是葡萄糖。葡萄汁经常用来发酵后制取葡萄酒，白兰地或者威士忌。在酿酒工业中，葡萄汁是一种必需的产品。和葡萄酒一样，葡萄汁也含有抗氧化剂例如类黄酮，有益于身体健康。这些抗氧化剂被证明有益于皮肤。', '7', '0', '纯果乐100%葡萄汁果汁饮料夏季饮品250ml*24瓶进口原料新鲜解渴', 'c4drink/c4_2juice/grapeJuice/grapeJuice1.jpg,c4drink/c4_2juice/grapeJuice/grapeJuice2.jpg', '192', '100');
INSERT INTO `good` VALUES ('43', '2020-09-16 22:16:14', '无', '橙汁（Orange juice），是以橙子为原料经过榨汁机压榨得到的果汁饮料。新鲜而营养价值高，可经过冷冻的方法饮用或直接饮用有人懒得吃水果，以为喝杯橙汁也多少能补充些维生素C，有1种说法是，放久了的橙汁对身体没有益处，而且摄入的糖分可能比喝汽水还高，多喝反而有害健康，事实如何呢？意大利一项研究指出，鲜橙汁摆放超过半小时，原来的营养成分便会灰飞烟灭；要是这杯“过气”橙汁还加了糖，热量比汽水还要高，不喝也罢。', '7', '0', '纯果乐 Tropicana 100%橙汁 果汁 1L单盒 1升乐享装百事可乐出品', 'c4drink/c4_2juice/orangeJuice/orangeJuice1.jpg,c4drink/c4_2juice/orangeJuice/orangeJuice2.jpg', '30', '100');
INSERT INTO `good` VALUES ('44', '2020-09-16 22:16:16', '无', '1886年，可口可乐在美国乔治亚州亚特兰大市诞生，自此便与社会发展相互交融，激发创新灵感。现在，它每天为全球的人们带来怡神畅快的美妙感受。目前，全球每天有17亿人次的消费者在畅饮可口可乐公司的产品，大约每秒钟售出19,400瓶饮料，在2016年10月，可口可乐公司排2016年全球100大最有价值品牌第三名  ；可口可乐为中国消费者提供超过15个品牌50多种饮料选择，其系列产品在华的每天享用量达到1.5亿杯， ', '7', '0', '\r\n可口可乐汽水碳酸饮料 300ml*12瓶/箱 整箱装 可口可乐出品饮品', 'c4drink/c4_3cola/cola/cola1.jpg,c4drink/c4_3cola/cola/cola2.jpg', '25', '100');
INSERT INTO `good` VALUES ('45', '2020-09-16 22:16:19', '无', '冰红茶，即红茶加冰制作的饮料。冰红茶确切的发明时间已无从考证，但在1929年夏天时突然流行起来。茶商理查（Richard Blechynden） 参加中国西湖博览会时向人推销红茶，由于盛夏酷暑，理查自己都喝不下热腾腾的红茶。灰心之际，一堆冰块意外掉进泡好的热红茶，倒掉可惜，便盛一杯来解渴，没想到冰红茶清凉畅快。理查灵机一动，转卖冰红茶，随即销售一空。冰红茶主要原料为红茶。两大类：一为产地茶，另一为混合茶。', '7', '0', '康师傅冰红茶柠檬红茶饮料500ml*15瓶量贩整箱装即饮 宅家囤货', 'c4drink/c4_3cola/iceRedTea/iceRedTea1.jpg,c4drink/c4_3cola/iceRedTea/iceRedTea2.jpg,c4drink/c4_3cola/iceRedTea/iceRedTea3.jpg', '52', '100');
INSERT INTO `good` VALUES ('46', '2020-09-16 22:16:22', '无', '脉动是维生素饮料的领导品牌  ，于2003年上市，一直深受崇尚健康的年轻消费者喜爱。2020年4月15日，脉动正式宣布品牌全方位焕新升级，除更换更高颜值、更时尚年轻的包装外，还进一步升级了配方，重磅推出了全新的“臻益活力配方” ，不仅添加了膳食纤维，富含维生素，还提高了人体所需维生素B族含量，并保持了脉动一贯以来的低糖健康和美味。', '7', '0', '脉动 青柠口味600ml*15瓶/箱 纤维低糖维生素运动功能饮料整箱装', 'c4drink/c4_3cola/maiDong/maiDong1.jpg,c4drink/c4_3cola/maiDong/maiDong2.jpg', '75', '100');
INSERT INTO `good` VALUES ('47', '2020-09-16 22:16:25', '无', '「雪碧」汽水产品与可口可乐公司的其他饮料产品齐头并进，如今已经成为美国发展速度领先的主要非酒精饮料产品之一，并且是全球深受青睐的柠檬味汽水非酒精饮料产品之一。2019年9月起，可口可乐旗下58年历史的饮料雪碧将从标志性绿瓶子换成更易回收的透明塑料瓶，因机械回收绿瓶再变为透明瓶子的过程实在困难，但雪碧并未将新瓶子成本转嫁给超市，因此对消费者而言价格不变。', '7', '0', '雪碧汽水饮料 300ml*24/箱 整箱装可口可乐原装口味官方出品碳酸', 'c4drink/c4_3cola/xuebi/xuebi1.jpg,c4drink/c4_3cola/xuebi/xuebi2.jpg', '55', '100');
INSERT INTO `good` VALUES ('48', '2020-09-16 22:16:28', '无', '汾酒，中国传统名酒，属于清香型白酒的典型代表。因产于山西省汾阳市杏花村，又称“杏花村酒”。汾酒以工艺精湛，源远流长，素以入口绵、落口甜、饮后余香、回味悠长特色而著称，在国内外消费者中享有较高的知名度、美誉度和忠诚度。历史上，汾酒曾经过了三次辉煌。汾酒有着4000年左右的悠久历史，1500年前的南北朝时期，汾酒作为宫廷御酒受到北齐武成帝的极力推崇，被载入二十四史，使汾酒一举成名。被誉为最早国酒，国之瑰宝，是凝聚着古代中国劳动人民的智慧的结晶和劳动成果。', '7', '0', '山西汾酒杏花村53度黄盖高度玻汾475ml清香型白酒天猫超市自营', 'c4drink/c4_4whiteWine/fenJiu/fenJiu1.png,c4drink/c4_4whiteWine/fenJiu/fenJiu2.jpg', '60', '100');
INSERT INTO `good` VALUES ('49', '2020-09-16 22:16:30', '无', '剑南春是中国传统白酒品牌，产于四川省绵竹市，与绵竹木版年画、赵坡茶并称为“绵竹三绝”  。因绵竹在唐代属剑南道，故称“剑南春”。其主要原料为糯米、大米、玉米、小麦、高粱  、水 ，主要产品有剑南春酒、珍藏级剑南春、金剑南、东方红等。2008年6月，剑南春酒传统酿造技艺入选国家级非物质文化遗产 。2018年4月，剑南春位列国际终极烈酒挑战赛中国白酒产品第一名，荣获最高奖“主席奖杯” 剑南春年份酒为什么能保证100%够年份？', '7', '0', '52度剑南春水晶剑名白酒酒水酒类500ml*2瓶浓香型酒厂直供瓶装', 'c4drink/c4_4whiteWine/jianNanChun/jianNanChun1.jpg,c4drink/c4_4whiteWine/jianNanChun/jianNanChun2.jpg', '1180', '100');
INSERT INTO `good` VALUES ('50', '2020-09-16 22:16:34', '无', '茅台酒是大曲酱香型酒的鼻祖,它具有色清透明、酱香突出、醇香馥郁、幽雅细腻、入口柔绵、清冽甘爽、酒体醇厚丰满、回味悠长的特点、人们把茅台酒独有的香味称为\"茅香\",是中国酱香型风格的典范。台酒，贵州省遵义市仁怀市茅台镇特产，中国国家地理标志产品。茅台酒是中国的传统特产酒。与苏格兰威士忌、法国科涅克白兰地齐名的世界三大蒸馏名酒之一，同时是中国三大名酒“茅五剑”之一。也是大曲酱香型白酒的鼻祖，已有800多年的历史。', '7', '0', '贵州茅台53度茅台迎宾酒500mlx6瓶装 整箱酒厂直供白酒送礼酒水', 'c4drink/c4_4whiteWine/maoTai/maoTai1.jpg,c4drink/c4_4whiteWine/maoTai/maoTai2.jpg', '900', '100');
INSERT INTO `good` VALUES ('51', '2020-09-16 22:16:37', '无', '五粮液，四川省宜宾市特产，中国国家地理标志产品。以五粮液为代表的中国白酒，有着3000多年的酿造历史，堪称世界最古老、最具神秘特色的食品制造产业之一。五粮液运用600多年的古法技艺，集高粱、大米、糯米、小麦和玉米等之精华，在独特的自然环境下酿造而成。五粮液以高粱、大米、糯米、小麦和玉米五种粮食为原料，以“包包曲”为动力，经陈年老窖发酵，长年陈酿、精心勾兑而成，并以“香气悠久、味醇厚、入口甘美、入喉净爽、各味谐调、恰到好处、酒味全面”的独特风格闻名于世。', '7', '0', '五粮液股份白酒A级精品52度500ml*6瓶整箱浓香型送礼送长辈含礼袋', 'c4drink/c4_4whiteWine/wuLiangYie/wuLiangYie1.jpg,c4drink/c4_4whiteWine/wuLiangYie/wuLiangYie2.jpg,c4drink/c4_4whiteWine/wuLiangYie/wuLiangYie3.jpg,c4drink/c4_4whiteWine/wuLiangYie/wuLiangYie4.jpg', '249', '100');
INSERT INTO `good` VALUES ('52', '2020-09-16 22:16:40', '无', '商品名称：伊利牛奶 商品编号：100007539539 商品毛重：3.4kg商品产地：中国 类别：纯牛奶 净含量：250ml 包装：整箱装 适用人群：儿童，成人，中老年，青少年 脂肪含量：全脂 是否添加糖：未添加糖 口味：原味 是否有机：非有机 蛋白质含量：非高蛋白', '7', '0', '超定制伊利金典纯牛奶24盒整箱儿童学生高端营养早餐奶批发特价', 'c4drink/c4_5milk/jinDian/jinDian1.jpg,c4drink/c4_5milk/jinDian/jinDian2.jpg', '130', '100');
INSERT INTO `good` VALUES ('53', '2020-09-16 22:16:43', '无', '商品名称：蒙牛纯牛奶 商品编号：2922989商品毛重：4.66kg商品产地：中国大陆货号：6923644282028类别：纯牛奶适用人群：儿童，成人，中老年，青少年 脂肪含量：全脂 净含量：250ml 是否添加糖：未添加糖 口味：原味包装：礼盒装 是否有机：非有机', '7', '0', '包邮蒙牛特仑苏纯牛奶250ml*16包/营养高端', 'c4drink/c4_5milk/mengNiu/mengNiu1.jpg,c4drink/c4_5milk/mengNiu/mengNiu2.jpg', '86', '100');
INSERT INTO `good` VALUES ('54', '2020-09-16 22:16:47', '无', '品牌： 蒙牛（MENGNIU）商品名称：蒙牛（MENGNIU）250ML*12\r\n商品编号：12205125268店铺： 沃尔玛官方旗舰店 商品毛重：3.48kg货号：692364426631类别：纯牛奶 适用人群：儿童，成人，中老年，青少年 脂肪含量：其它 净含量：其它 是否添加糖：未添加糖 口味：原味 包装：整箱装 是否有机：非有机\r\n', '7', '0', '包邮蒙牛特仑苏纯牛奶250ml*16包/营养高端', 'c4drink/c4_5milk/teLunSu/teLunSu1.jpg,c4drink/c4_5milk/teLunSu/teLunSu2.jpg', '86', '100');
INSERT INTO `good` VALUES ('55', '2020-09-16 22:16:51', '无', '品牌： 伊利 商品名称：伊利伊利无菌砖高钙低脂奶250ml*24商品编号：100004036327商品毛重：6.62kg商品产地：中国大陆 口味：原味 类别：纯牛奶 适用人群：儿童，成人，中老年，青年', '7', '0', '伊利无菌砖纯牛奶250ml*24盒/整箱营养儿童学生早餐纯奶', 'c4drink/c4_5milk/yiLi/yiLi1.jpg,c4drink/c4_5milk/yiLi/yiLi2.jpg', '72', '100');
INSERT INTO `good` VALUES ('56', '2020-09-16 22:16:54', '无', '家里的白色包包、浅色的沙发甚至是墙壁脏了怎么办。可不能用水洗啊，容易开裂，那怎么办，专门找人清洁似乎又很麻烦，不要着急，只要用一块小小的橡皮就能搞定，包包、沙发等皮制品可以用橡皮来擦，还不会损伤表面，手机外壳也可以用橡皮擦的哦还有很多很多的地方都是可以用橡皮来擦拭的。小学生擦错别字时，本想擦的既快又干干净净，往往是用橡皮蘸一下唾沫，然后去擦，恰恰相反，错别字擦掉了，本子也烂了。', '7', '0', '晨光30只橡皮擦4b米菲学生专用考试铅笔不留痕卡通美术素描无碎屑', 'c5dailyGood/c5_1stationery/eraser/eraser1.jpg,c5dailyGood/c5_1stationery/eraser/eraser2.jpg', '30', '100');
INSERT INTO `good` VALUES ('57', '2020-09-16 22:16:58', '无', '品牌： 齐心（COMIX）商品名称：齐心（COMIX）C4801商品编号：65589686321店铺： 齐心办公专卖店 商品毛重：1.0kg 商品产地：中国大陆 货号：C4801页数：31-50页 封面硬度：软面抄 类型：笔记本/记事本装订方式：胶钉式装订 内芯幅面规格：A5适用人群：商务办公人士数量：2-6本 封面材质：普通纸', '7', '0', '齐心文具本子加厚笔记本A5记事本软面本学生抄写作业本子10本装', 'c5dailyGood/c5_1stationery/exerciseBook/exerciseBook1.jpg,c5dailyGood/c5_1stationery/exerciseBook/exerciseBook2.jpg', '20', '100');
INSERT INTO `good` VALUES ('58', '2020-09-16 22:17:00', '无', '品牌： 英雄（HERO）商品名称：英雄359商品编号：1002650商品毛重：60.00g商品产地：浙江笔尖材质：铱金笔 笔杆颜色：黑色系 类型：钢笔 包装方式：单支装 笔尖种类：标准型 风格：经典 书写粗细：EF尖 笔尖嵌入方式：明尖 笔杆材质：塑料 上墨方式：墨胆，旋转吸墨 笔身特点：光面 适用场景：日常书写', '7', '0', '英雄钢笔学生练字3支套装硬笔书法复古怀旧经典款特细3色依金钢笔', 'c5dailyGood/c5_1stationery/pen/pen1.jpg,c5dailyGood/c5_1stationery/pen/pen2.jpg', '22', '100');
INSERT INTO `good` VALUES ('59', '2020-09-16 22:17:02', '无', '品牌： 得力（deli）商品名称：得力7084商品编号：947423商品毛重：80.00g商品产地：中国大陆 包装方式：纸盒装 笔杆颜色：黑色系 笔杆类型：六角杆 笔芯硬度：2B 数量：7-12支 款式：不带橡皮头 笔杆材质：木质 风格：经典 特性：标准 适用场景：考试专用', '7', '0', '得力铅笔30支橡皮削笔刀票夹套装学生考试素描无毒', 'c5dailyGood/c5_1stationery/pencil/pencil1.jpg,c5dailyGood/c5_1stationery/pencil/pencil2.jpg,c5dailyGood/c5_1stationery/pencil/pencil3.jpg', '39', '100');
INSERT INTO `good` VALUES ('60', '2020-09-16 22:17:08', '无', '品牌： 马利（Marie\'s）商品名称：马利素描铅笔12b14b套装软中硬炭笔绘图绘画美术铅笔2b绘画碳笔 2H【整盒12支】商品编号：11403065538\r\n店铺： 荆阳办公文具专营店 商品毛重：200.00g类型：其他 数量：套装\r\n', '7', '0', '马利素描铅笔炭笔美术生专用速写套装马力软炭软中硬全套14b亚光2h2b4b6b8b10b12b玛丽软性特浓软碳绘画比', 'c5dailyGood/c5_2workTool/compasses/compasses1.jpg,c5dailyGood/c5_2workTool/compasses/compasses2.jpg', '13', '100');
INSERT INTO `good` VALUES ('61', '2020-09-16 22:17:10', '无', '得力（deli）颜色：黄色（外壳）规格：15g 包装：12支/盒 包装清单PVP固体胶1盒 12支', '7', '0', '\r\n欧阳娜娜Deli/得力胶水萌伊液体胶水35ml*1瓶玩具折纸手工DIY办公', 'c5dailyGood/c5_2workTool/glue/glue1.jpg,c5dailyGood/c5_2workTool/glue/glue2.jpg', '3', '100');
INSERT INTO `good` VALUES ('62', '2020-09-16 22:17:13', '无', '品牌： 得力（deli）商品名称：得力（deli） 比例尺 三棱尺 三角大小制图设计 30cm 三菱比例尺 8930 单只装（颜色随机）商品编号：12191150336\r\n店铺： 得力齐达利专卖店 商品毛重：100.00g商品产地：中国大陆 货号：8930类型：绘图测量 优选服务：价保15天，免费教学\r\n', '7', '0', '得力塑料直尺20 30 40 50厘米塑料学生直尺绘图长尺工程测量尺子', 'c5dailyGood/c5_2workTool/ruler/ruler1.jpg,c5dailyGood/c5_2workTool/ruler/ruler2.jpg', '3', '100');
INSERT INTO `good` VALUES ('63', '2020-09-16 22:17:15', '无', '品牌： 得力（deli）商品名称：得力（deli） 学生文具儿童剪刀卡通安全剪刀圆头手工剪纸刀 单个价 办公用品 6021 蓝色 商品编号：1608344592\r\n店铺： 得力办公官方旗舰店 商品毛重：30.00g类型：剪刀/美工刀\r\n', '7', '0', '剪刀学生手工剪纸刀子便捷式办公家用不锈钢美工大中小号厨房缝纫', 'c5dailyGood/c5_2workTool/scissor/scissor1.jpg,c5dailyGood/c5_2workTool/scissor/scissor2.jpg', '6', '100');
INSERT INTO `good` VALUES ('64', '2020-09-16 22:17:05', '无', '品牌： 飞科（FLYCO）商品名称：【飞科官方旗舰店】飞科（FLYCO）便携吹风机电吹风负离子家用宿舍学生大功率深度养发FH6276 【1800W速干不伤发】负离子FH6276商品编号：64882563325店铺： 飞科官方旗舰店商品毛重：0.6kg\r\n适用发质：细软发质，中性发质，油性发质，粗硬发质 功率：1800W特色功能：多倍负离子，恒温护发 适用场景：校园，家用HUAWEI\r\n', '7', '0', '飞科电吹风机家用大功率负离子护发理发店用吹风筒静音宿舍用学生', 'c5dailyGood/c5_3miniEle/dianChuiFeng/dianChuiFeng1.jpg,c5dailyGood/c5_3miniEle/dianChuiFeng/dianChuiFeng2.jpg', '240', '100');
INSERT INTO `good` VALUES ('65', '2020-09-16 22:17:23', '无', '品牌： 华为（）商品名称：华为原装5A数据线type-c充电器线快充P40P20P30Mate30荣耀30/pro/nova7 充电套装（4.5V5A闪充头+5A闪充线） 华为 商品编号：41638238057店铺： 华为翼天宏专卖店商品毛重：100.00g商品产地：中国大陆货号：AP71材质：TPE特点：快充接口：Type-C类型：单条装 长度：1米', '7', '0', '华为原装P30 P40Mate30/20 pro数据线P20官方P10充电线5A超级快充nova5/6/7se手机原厂type-c荣耀10正品冲v10', 'c5dailyGood/c5_3miniEle/shuJuXian/shuJuXian1.jpg,c5dailyGood/c5_3miniEle/shuJuXian/shuJuXian2.jpg', '60', '100');
INSERT INTO `good` VALUES ('66', '2020-09-16 22:17:30', '无', '品牌： 孩视宝 商品名称：孩视宝LED减蓝光落地护眼灯 学生书桌学习客厅卧室简约现代钢琴落地台灯无频闪自然均匀光 商品编号：22330671120店铺： 孩视宝优饰专卖店 商品毛重：3.0kg电压(V)：≤36V色温(k)：自然光（3300K-5000K）风格：简约现代 功率(W)：0-20W（含）光源类型：LED灯身材质：不锈钢 控制方式：触摸控制 灯罩材质：树脂照射面积(㎡)：0-3㎡（含）\r\n适用场景：客厅，卧室，书房，办公室\r\n', '7', '0', '孩视宝钢琴护眼落地台灯卧室客厅书房立式极简ins风钓鱼灯VL706', 'c5dailyGood/c5_3miniEle/taiDeng/taiDeng1.jpg,c5dailyGood/c5_3miniEle/taiDeng/taiDeng2.jpg', '579', '100');
INSERT INTO `good` VALUES ('67', '2020-09-16 23:43:30', '无', '品牌： 飞科（FLYCO）商品名称：【官旗】飞科（FLYCO）FS926智能感应剃须刀男士刮胡刀电动全身水洗剃胡须刀 FS926标配【1小时速充 智能感应剃须】商品编号：70836099494 店铺： 飞科官方旗舰店 商品毛重：0.6kg刀头类型：三刀头 产品类别：旋转式剃须刀 产地归属：整机国产 充电时间：1小时快充续航时间：60分钟以上 清洁类型：全身水洗\r\n\r\n', '7', '0', '飞科剃须刀电动男士刮胡刀全身水洗智能充电式胡须刀正品刮胡子刀', 'c5dailyGood/c5_3miniEle/tiHuDao/tiHuDao1.jpg,c5dailyGood/c5_3miniEle/tiHuDao/tiHuDao2.jpg', '399', '100');

-- ----------------------------
-- Table structure for good_cat
-- ----------------------------
DROP TABLE IF EXISTS `good_cat`;
CREATE TABLE `good_cat` (
  `good_id` int NOT NULL,
  `cat_one_id` int DEFAULT NULL,
  `cat_two_id` int DEFAULT NULL,
  PRIMARY KEY (`good_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of good_cat
-- ----------------------------
INSERT INTO `good_cat` VALUES ('1', '1', '11');
INSERT INTO `good_cat` VALUES ('2', '1', '11');
INSERT INTO `good_cat` VALUES ('3', '1', '11');
INSERT INTO `good_cat` VALUES ('4', '1', '11');
INSERT INTO `good_cat` VALUES ('5', '1', '11');
INSERT INTO `good_cat` VALUES ('6', '1', '12');
INSERT INTO `good_cat` VALUES ('7', '1', '12');
INSERT INTO `good_cat` VALUES ('8', '1', '13');
INSERT INTO `good_cat` VALUES ('9', '1', '13');
INSERT INTO `good_cat` VALUES ('10', '1', '13');
INSERT INTO `good_cat` VALUES ('11', '1', '14');
INSERT INTO `good_cat` VALUES ('12', '1', '14');
INSERT INTO `good_cat` VALUES ('13', '2', '21');
INSERT INTO `good_cat` VALUES ('14', '2', '21');
INSERT INTO `good_cat` VALUES ('15', '2', '21');
INSERT INTO `good_cat` VALUES ('16', '2', '22');
INSERT INTO `good_cat` VALUES ('17', '2', '22');
INSERT INTO `good_cat` VALUES ('18', '2', '22');
INSERT INTO `good_cat` VALUES ('19', '2', '22');
INSERT INTO `good_cat` VALUES ('20', '2', '23');
INSERT INTO `good_cat` VALUES ('21', '2', '23');
INSERT INTO `good_cat` VALUES ('22', '2', '23');
INSERT INTO `good_cat` VALUES ('23', '2', '24');
INSERT INTO `good_cat` VALUES ('24', '2', '25');
INSERT INTO `good_cat` VALUES ('25', '3', '31');
INSERT INTO `good_cat` VALUES ('26', '3', '31');
INSERT INTO `good_cat` VALUES ('27', '3', '32');
INSERT INTO `good_cat` VALUES ('28', '3', '32');
INSERT INTO `good_cat` VALUES ('29', '3', '32');
INSERT INTO `good_cat` VALUES ('30', '3', '33');
INSERT INTO `good_cat` VALUES ('31', '3', '33');
INSERT INTO `good_cat` VALUES ('32', '3', '33');
INSERT INTO `good_cat` VALUES ('33', '3', '34');
INSERT INTO `good_cat` VALUES ('34', '3', '34');
INSERT INTO `good_cat` VALUES ('35', '3', '34');
INSERT INTO `good_cat` VALUES ('36', '4', '41');
INSERT INTO `good_cat` VALUES ('37', '4', '41');
INSERT INTO `good_cat` VALUES ('38', '4', '41');
INSERT INTO `good_cat` VALUES ('39', '4', '41');
INSERT INTO `good_cat` VALUES ('40', '4', '42');
INSERT INTO `good_cat` VALUES ('41', '4', '42');
INSERT INTO `good_cat` VALUES ('42', '4', '42');
INSERT INTO `good_cat` VALUES ('43', '4', '42');
INSERT INTO `good_cat` VALUES ('44', '4', '43');
INSERT INTO `good_cat` VALUES ('45', '4', '43');
INSERT INTO `good_cat` VALUES ('46', '4', '43');
INSERT INTO `good_cat` VALUES ('47', '4', '43');
INSERT INTO `good_cat` VALUES ('48', '4', '44');
INSERT INTO `good_cat` VALUES ('49', '4', '44');
INSERT INTO `good_cat` VALUES ('50', '4', '44');
INSERT INTO `good_cat` VALUES ('51', '4', '44');
INSERT INTO `good_cat` VALUES ('52', '4', '45');
INSERT INTO `good_cat` VALUES ('53', '4', '45');
INSERT INTO `good_cat` VALUES ('54', '4', '45');
INSERT INTO `good_cat` VALUES ('55', '4', '45');
INSERT INTO `good_cat` VALUES ('56', '5', '51');
INSERT INTO `good_cat` VALUES ('57', '5', '51');
INSERT INTO `good_cat` VALUES ('58', '5', '51');
INSERT INTO `good_cat` VALUES ('59', '5', '51');
INSERT INTO `good_cat` VALUES ('60', '5', '52');
INSERT INTO `good_cat` VALUES ('61', '5', '52');
INSERT INTO `good_cat` VALUES ('62', '5', '52');
INSERT INTO `good_cat` VALUES ('63', '5', '52');
INSERT INTO `good_cat` VALUES ('64', '5', '53');
INSERT INTO `good_cat` VALUES ('65', '5', '53');
INSERT INTO `good_cat` VALUES ('66', '5', '53');
INSERT INTO `good_cat` VALUES ('67', '5', '53');

-- ----------------------------
-- Table structure for good_form
-- ----------------------------
DROP TABLE IF EXISTS `good_form`;
CREATE TABLE `good_form` (
  `form_id` int NOT NULL,
  `good_id` varchar(255) NOT NULL,
  `good_number` varchar(255) NOT NULL,
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of good_form
-- ----------------------------
INSERT INTO `good_form` VALUES ('1', '1,2,', '1,1,');
INSERT INTO `good_form` VALUES ('2', '2,3,', '2,1,');
INSERT INTO `good_form` VALUES ('3', '3,40,', '3,1,');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_money` int DEFAULT NULL,
  PRIMARY KEY (`user_id`,`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '卓然', '4772');

-- ----------------------------
-- Table structure for user_form
-- ----------------------------
DROP TABLE IF EXISTS `user_form`;
CREATE TABLE `user_form` (
  `user_id` int NOT NULL,
  `form_id` int DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user_form
-- ----------------------------
