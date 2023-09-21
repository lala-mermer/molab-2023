import UIKit
let renderer = UIGraphicsImageRenderer(size: CGSize(width: 1024, height: 1024))

func imageFor(_ str: String) -> UIImage {
    let url = URL(string: str)
    let imgData = try? Data(contentsOf: url!)
    let uiImage = UIImage(data:imgData!)
    return uiImage!
}

// profile image
let u1 = "https://order.sugarbloombakery.com/cdn/shop/products/plain-croissant_900x.jpg?v=1588644797"
let img1 = imageFor(u1)

// itp staff
let u2 = "https://memesfeel.com/wp-content/uploads/2023/01/Borzoi-dog-meme-e15920f777757d4bb86ecd3ed3356ca7.jpg"
let img2 = imageFor(u2)

let u3 =
    "https://media.gq-magazine.co.uk/photos/5da09d57d8907900082b7e10/16:9/w_2240,c_limit/20191011-Succession-03.jpg"
let img3 = imageFor(u3)

let u4 =
    "https://images.moziornament.com/2023/07/Official-kendall-Roy-I-Am-The-Eldest-Boy-Shirt-Men-shirt.jpg"
let img4 = imageFor(u4)

let image = renderer.image { context in
    
    img1.draw(in: CGRect(x: 0, y: 0, width: 500, height: 500))
    img2.draw(in: CGRect(x: 500, y: 0, width: 500, height: 500))
    img3.draw(in: CGRect(x: 500, y: 500, width: 500, height: 500))
    img4.draw(in: CGRect(x: 0, y: 500, width: 500, height: 500))

}
image
