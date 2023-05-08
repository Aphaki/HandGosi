//
//  CoreDataService.swift
//  HandGosi
//
//  Created by Sy Lee on 2023/04/22.
//

import Foundation
import CoreData

class CoreDataService {
    
    @Published var saveModel: [SaveModel] = []
    
    var context = NSPersistentContainer(name: "SaveContainer").viewContext
    
    func addNote(at myNoteSaveData: MyNoteQuSaveModel) {
        let aNote = SaveModel(context: context)
        aNote.questionNum = Int16(myNoteSaveData.questionNum)
        aNote.subject = myNoteSaveData.subject
        aNote.type = myNoteSaveData.type
        aNote.year = Int16(myNoteSaveData.year)
        saveModel.append(aNote)
        saveData()
    }
    
    func saveData() {
        do {
            try context.save()
        } catch {
            print("CoreDataService - saveData() error: \(error)")
        }
    }
    func deleteNote(at myNoteSaveData: MyNoteQuSaveModel) {
        
        // 위 어레이에서 제거
        if let selectedEntity =
        saveModel.first(where: { aSavemodel in
            return aSavemodel.questionNum == myNoteSaveData.questionNum &&
            aSavemodel.subject == myNoteSaveData.subject &&
            aSavemodel.type == myNoteSaveData.type &&
            aSavemodel.year == myNoteSaveData.year
        }) {
            context.delete(selectedEntity)
        }
    }
    
    func updateData() {
        
    }
    
    func loadData() {
        let request = NSFetchRequest<SaveModel>(entityName: "SaveModel")
        do {
            self.saveModel = try context.fetch(request)
        } catch {
            print("CoreDataService - loadData() error: \(error)")
        }
    }
}
