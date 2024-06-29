export type PagedResponseDTO = {
    items: Product[]
    totalItems: number
    pageNumber: number
    pageSize: number
    totalPages: number
}

export type Product = {
    id: number
    code: string
    name: string
    price: number
    quantity: number
    description: string
}