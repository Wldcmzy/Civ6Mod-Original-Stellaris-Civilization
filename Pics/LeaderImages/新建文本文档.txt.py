import cv2

def flip_image_horizontal(image_path, save_path):
    # 读取图片
    img = cv2.imread(image_path, cv2.IMREAD_UNCHANGED)

    # 水平反转
    flipped_img = cv2.flip(img, 1)

    # 保存反转后的图片
    cv2.imwrite(save_path, flipped_img)

if __name__ == "__main__":
    # 输入图片路径和保存路径
    input_image_path = "_IMG_LEADER_STELLARIS_ZOEY_3_BACKGROUND.png"  # 替换为你的输入图片路径
    output_image_path = "IMG_LEADER_STELLARIS_ZOEY_3_BACKGROUND.png"  # 替换为你的输出图片保存路径

    # 调用函数进行水平反转
    flip_image_horizontal(input_image_path, output_image_path)
