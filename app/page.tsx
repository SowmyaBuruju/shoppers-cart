import { ShoppingCart } from "lucide-react"
import Image from "next/image"
import Link from "next/link"

import { Button } from "@/components/ui/button"
import { Card, CardContent, CardFooter } from "@/components/ui/card"
import { Input } from "@/components/ui/input"
import { ScrollArea, ScrollBar } from "@/components/ui/scroll-area"
import { Separator } from "@/components/ui/separator"
import { Sheet, SheetContent, SheetHeader, SheetTitle, SheetTrigger } from "@/components/ui/sheet"
import { CartItems } from "@/components/cart-items"
import { ProductGrid } from "@/components/product-grid"

export default function Home() {
  return (
    <div className="flex flex-col min-h-screen">
      <header className="sticky top-0 z-50 w-full border-b bg-background/95 backdrop-blur supports-[backdrop-filter]:bg-background/60">
        <div className="container flex h-14 items-center">
          <Link href="/" className="flex items-center space-x-2">
            <span className="font-bold">SHOPPERS</span>
          </Link>
          <div className="flex items-center space-x-4 ml-auto">
            <div className="w-full flex-1 md:w-auto md:flex-none">
              <Input type="search" placeholder="Search products..." className="h-9 md:w-[300px] lg:w-[400px]" />
            </div>
            <Sheet>
              <SheetTrigger asChild>
                <Button size="icon" variant="ghost">
                  <ShoppingCart className="h-5 w-5" />
                  <span className="sr-only">Open cart</span>
                </Button>
              </SheetTrigger>
              <SheetContent>
                <SheetHeader>
                  <SheetTitle>Shopping Cart</SheetTitle>
                </SheetHeader>
                <CartItems />
              </SheetContent>
            </Sheet>
          </div>
        </div>
      </header>
      <main className="flex-1">
        <section className="px-4 sm:px-6 lg:px-8 py-8">
          <div className="flex items-center justify-between">
            <h1 className="text-2xl font-bold tracking-tight">New Arrivals</h1>
            <div className="flex items-center space-x-4">
              <Button variant="ghost" size="sm">
                Filter
              </Button>
              <Button variant="ghost" size="sm">
                Sort
              </Button>
            </div>
          </div>
          <Separator className="my-4" />
          <ProductGrid />
        </section>
      </main>
      <footer className="border-t">
        <div className="container flex flex-col gap-2 sm:flex-row py-6 text-sm">
          <p className="text-xs text-muted-foreground">© 2024 Shoppers, Inc. All rights reserved.</p>
          <nav className="sm:ml-auto flex gap-4 sm:gap-6">
            <Link className="text-xs text-muted-foreground hover:underline underline-offset-4" href="#">
              Terms of Service
            </Link>
            <Link className="text-xs text-muted-foreground hover:underline underline-offset-4" href="#">
              Privacy
            </Link>
          </nav>
        </div>
      </footer>
    </div>
  )
}

