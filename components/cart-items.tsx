"use client"

import { useState } from "react"
import Image from "next/image"
import { Minus, Plus, Trash2 } from "lucide-react"

import { Button } from "@/components/ui/button"
import { ScrollArea } from "@/components/ui/scroll-area"
import { Separator } from "@/components/ui/separator"

interface CartItem {
  id: number
  name: string
  price: number
  image: string
  quantity: number
}

export function CartItems() {
  const [items, setItems] = useState<CartItem[]>([
    {
      id: 1,
      name: "Cotton Blend T-Shirt",
      price: 29.99,
      image: "/placeholder.svg?height=100&width=100",
      quantity: 1,
    },
    // Add more items as needed
  ])

  const updateQuantity = (id: number, change: number) => {
    setItems(
      items
        .map((item) => {
          if (item.id === id) {
            const newQuantity = Math.max(0, item.quantity + change)
            return newQuantity === 0 ? null : { ...item, quantity: newQuantity }
          }
          return item
        })
        .filter(Boolean) as CartItem[],
    )
  }

  const total = items.reduce((sum, item) => sum + item.price * item.quantity, 0)

  return (
    <div className="flex h-full flex-col">
      <ScrollArea className="flex-1 px-4">
        <div className="space-y-4 py-4">
          {items.map((item) => (
            <div key={item.id} className="flex items-start gap-4">
              <div className="relative aspect-square h-16 w-16 min-w-fit overflow-hidden rounded">
                <Image src={item.image || "/placeholder.svg"} alt={item.name} fill className="object-cover" />
              </div>
              <div className="flex flex-1 flex-col gap-1">
                <h3 className="font-semibold">{item.name}</h3>
                <p className="text-sm text-muted-foreground">${item.price.toFixed(2)}</p>
                <div className="flex items-center gap-2">
                  <Button variant="outline" size="icon" className="h-8 w-8" onClick={() => updateQuantity(item.id, -1)}>
                    <Minus className="h-4 w-4" />
                    <span className="sr-only">Decrease quantity</span>
                  </Button>
                  <span className="w-8 text-center">{item.quantity}</span>
                  <Button variant="outline" size="icon" className="h-8 w-8" onClick={() => updateQuantity(item.id, 1)}>
                    <Plus className="h-4 w-4" />
                    <span className="sr-only">Increase quantity</span>
                  </Button>
                </div>
              </div>
              <Button
                variant="ghost"
                size="icon"
                className="h-8 w-8"
                onClick={() => updateQuantity(item.id, -item.quantity)}
              >
                <Trash2 className="h-4 w-4" />
                <span className="sr-only">Remove item</span>
              </Button>
            </div>
          ))}
        </div>
      </ScrollArea>
      <div className="px-4 py-6">
        <Separator className="mb-4" />
        <div className="space-y-4">
          <div className="flex items-center justify-between text-base font-medium">
            <span>Total</span>
            <span>${total.toFixed(2)}</span>
          </div>
          <Button className="w-full">Checkout</Button>
        </div>
      </div>
    </div>
  )
}

