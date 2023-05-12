//
//  ProductService.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/05/12.
//

import Foundation
import StoreKit

class ProductService {
    @Published var currentProducts: [Product] = []
    @Published var purchasedIds: [String] = []
    
    private var updates: Task<Void, Never>? = nil
    
    let productIdOne: String = "com.maru.handgosi"
    
    init() {
        
        Task(priority: .high) {
            try await fetchProducts()
        }
        Task(priority: .low) {
            await checkProduct()
        }
//        updates = observeTransactionUpdates()
        
    }
    
    func fetchProducts() async throws {
        let products = try await Product.products(for: [productIdOne])
        print("Fetch Products() complete : \(products)")
        DispatchQueue.main.async {
            self.currentProducts = products
        }
//        guard let product = products.first else { fatalError("fetchProducts() - 상품이 없습니다.") }
    }
    
    func purchaseProduct() async throws ->  StoreKit.Transaction {
        guard let product = currentProducts.first else {
            fatalError("상품이 없습니다.")
        }
        let result = try await product.purchase()
        switch result {
        case .success(let verification):
            switch verification {
            case .verified(let transaction):
                await transaction.finish()
                await self.checkProduct()
                print("유효한 구매: \(transaction.productID)")
                return transaction
            case .unverified(_ , let error):
                print("유효하지 않은 구매: \(error)")
                throw PurchaseError.fail
            }
        case .pending:
            throw PurchaseError.pending
        case .userCancelled:
            throw PurchaseError.cancelled
        @unknown default:
            throw PurchaseError.fail
        }
        
        
    }
    
    func checkProduct() async {
        guard let product = self.currentProducts.first else {
            print("ProductService - product is empty")
            return
        }
        
        let state = await product.currentEntitlement
        switch state {
        case .verified(let transaction):
            if purchasedIds.isEmpty {
                DispatchQueue.main.async {
                    self.purchasedIds.append(transaction.productID)
                }
            }
            print("이미 \(transaction.productID) 상품을 보유하고있습니다.")
        case .none:
            print("checkProduct() - none 상태입니다.")
        case .some(.unverified(_, _)):
            print("checkProduct() - unverified 상태입니다.")
        }
        
    }
    
    private func observeTransactionUpdates() -> Task<Void, Never> {
            Task(priority: .background) { [unowned self] in
                for await verificationResult in Transaction.updates {
                    
                    let value = verificationResult.deviceVerification
                    
                    print("observeTransactionUpdates() - \(value)")
//                    guard let product = self.currentProducts.first else { fatalError("지불작업 업데이트 에러") }
                    
                    await self.checkProduct()
                }
            }
        }
    
    enum PurchaseError: Error {
        case pending, fail, cancelled
    }
}
