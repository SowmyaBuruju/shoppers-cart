import Image from "next/image"
import Link from "next/link"
import { Heart, ShoppingCart } from "lucide-react"

import { Button } from "@/components/ui/button"
import { Card, CardContent, CardFooter } from "@/components/ui/card"

const products = [
  {
    id: 1,
    name: "Cotton Blend T-Shirt",
    price: 29.99,
    image: "/placeholder.svg?height=400&width=300",
    category: "T-Shirts",
  },
  {
    id: 2,
    name: "Slim Fit Jeans",
    price: 59.99,
    image: "/placeholder.svg?height=400&width=300",
    category: "Jeans",
  },
  {
    id: 3,
    name: "Casual Hoodie",
    price: 49.99,
    image: "/placeholder.svg?height=400&width=300",
    category: "Hoodies",
  },
  // Add more products as needed
]

export function ProductGrid() {
  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-6">
      {products.map((product) => (
        <Card key={product.id} className="group relative">
          <CardContent className="p-0">
            <Link href={`/products/${product.id}`}>
              <div className="aspect-square relative overflow-hidden rounded-t-lg">
                <Image
                  src={product.image || "/placeholder.svg"}
                  alt={product.name}
                  className="object-cover transition-transform group-hover:scale-105"
                  fill
                  sizes="(min-width: 1024px) 25vw, (min-width: 768px) 33vw, (min-width: 640px) 50vw, 100vw"
                />
              </div>
            </Link>
          </CardContent>
          <CardFooter className="grid gap-2 p-4">
            <div className="flex items-center justify-between">
              <div>
                <h3 className="font-semibold">{product.name}</h3>
                <p className="text-sm text-muted-foreground">{product.category}</p>
              </div>
              <Button size="icon" variant="ghost">
                <Heart className="h-5 w-5" />
                <span className="sr-only">Add to wishlist</span>
              </Button>
            </div>
            <div className="flex items-center justify-between">
              <p className="font-semibold">${product.price}</p>
              <Button size="sm">
                <ShoppingCart className="h-4 w-4 mr-2" />
                Add to Cart
              </Button>
            </div>
          </CardFooter>
        </Card>
      ))}
    </div>
  )
}

