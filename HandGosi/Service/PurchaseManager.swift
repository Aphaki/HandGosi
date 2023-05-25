//
//  PurchaseManager.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/05/15.
//

import Foundation
import StoreKit

@MainActor
class PurchaseManager: ObservableObject {

    //MARK: - 프로퍼티
    private let productIds = ["com.maru.handgosi4"]

    @Published
    private(set) var products: [Product] = []
    private var productsLoded = false

    @Published
    private(set) var purchasedProductIDs = Set<String>()

    var hasUnlockedPro: Bool {
        return !self.purchasedProductIDs.isEmpty
    }

    private var updates: Task<Void, Never>? = nil

    //MARK: - init, deinit
    init() {
        updates = observeTransactionUpdates()
    }

    deinit {
        updates?.cancel()
    }


    //MARK: - 로드, 구매
    func loadProducts() async throws {
        guard !self.productsLoded else { return } // true 면 그냥 리턴
        self.products = try await Product.products(for: productIds)
        print("확인용 - PurchaseManager - loadedProducts : \(products)")
        self.productsLoded = true
    }

    func purchase(_ product: Product) async throws {
        let result = try await product.purchase()

        switch result {
        case let .success(.verified(transaction)):
            await transaction.finish()
            await self.updatePurchasedProducts()
        case .success(.unverified(_, _)):
            break
        case .userCancelled:
            break
        case .pending:
            break

        @unknown default:
            break
        }
    }

    //MARK: - 구매상태 업데이트
    func updatePurchasedProducts() async {
        for await result in Transaction.currentEntitlements {
            guard case .verified(let transaction) = result else {
                continue
            }
            if transaction.revocationDate == nil {
                self.purchasedProductIDs.insert(transaction.productID)
            } else {
                self.purchasedProductIDs.remove(transaction.productID)
            }
        }
        print("확인용 - updatePurchasedProducts() - purchasedProductIDs: \(productIds)")
    }




    private func observeTransactionUpdates() -> Task<Void, Never> {
        Task(priority: .background) { [unowned self] in
            for await verificationResult in Transaction.updates {
                print("observeTransactionUpdates() - verificationResult : \(verificationResult)")
                await self.updatePurchasedProducts()
            }
        }
    }

}
