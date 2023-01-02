//
//  HabitusCardView.swift
//  HabitusApp
//
//  Created by Erik Loures on 02/01/23.
//

import SwiftUI

struct HabitusCardView: View {
    
    @State private var action = false
    
    let viewModel: HabitusCardViewModel
    
    var body: some View {
        ZStack(alignment: .trailing) {
        
        NavigationLink(destination: Text("Destination"),
                       isActive: self.$action,
                       label: { EmptyView()
      }
     )
        Button(action: {
        self.action = true
        }, label: {
        
            HStack {
        Image(systemName: "square.and.pencil")
        .padding(.horizontal, 9)
                
        Spacer()
                
            HStack (alignment: .top) {
                Spacer()
            VStack(alignment: .leading, spacing: 4) {
                
        Text (viewModel.name)
            .foregroundColor (Color.blue)
        Text (viewModel.label)
            .foregroundColor (Color ("textColor"))
        .bold()
        Text (viewModel.date)
            .foregroundColor(Color ("textColor" ))
        .bold()
                
                    
            }.frame(maxWidth: 300, alignment: .leading)
                
                Spacer()
                
            VStack(alignment: .leading, spacing: 4) {
                Text("Registrado")
                .foregroundColor(Color.blue)
                .bold()
                //multiline sempre depois ou em baixo do bold
                .multilineTextAlignment(.leading)
                
                Text(viewModel.value)
                .foregroundColor(Color("textColor"))
                .bold()
                //multiline sempre depois ou em baixo do bold
                .multilineTextAlignment(.leading)
                
                
                
            }
                Spacer()
          }
                Spacer()
        }
            .padding()
            .cornerRadius(4.0)
      })
        Rectangle()
        .frame(width: 8)
        .foregroundColor(viewModel.state)
            
            
    }.background(
        RoundedRectangle(cornerRadius: 4.0)
            .stroke(Color.blue, lineWidth: 1.4)
            .shadow (color: .blue, radius: 2, x: 2.0, y: 2.0)
    )
    .padding(.horizontal, 3)
    .padding(.top, 8)
    .padding()
  }
}

struct HabitusCardView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
        NavigationView {
            
        List {
            HabitusCardView(viewModel:
                                HabitusCardViewModel(id: 1,
                                                   icon: "https://via.placeholder.com/150",
                                                   date: "01/01/2023 00:00:00",
                                                   name: "Estudar Swift",
                                                  label: "horas",
                                                  value: "2",
                                                  state: .blue))
           // Spacer()
            HabitusCardView(viewModel:
                                HabitusCardViewModel(id: 1,
                                                   icon: "https://via.placeholder.com/150",
                                                   date: "01/01/2023 00:00:00",
                                                   name: "Estudar C#",
                                                  label: "horas",
                                                  value: "2",
                                                  state: .blue))
            // Spacer()
            HabitusCardView(viewModel:
                                HabitusCardViewModel(id: 1,
                                                   icon: "https://via.placeholder.com/150",
                                                   date: "01/01/2023 00:00:00",
                                                   name: "Estudar Bando de Dados",
                                                  label: "horas",
                                                  value: "2",
                                                  state: .blue))
//            Spacer()
//            HabitusCardView(viewModel:
//                                HabitusCardViewModel(id: 1,
//                                                   icon: "https://via.placeholder.com/150",
//                                                   date: "01/01/2023 00:00:00",
//                                                   name: "Estudar Bando de Dados",
//                                                  label: "horas",
//                                                  value: "2",
//                                                  state: .blue))
//            Spacer()
//            HabitusCardView(viewModel:
//                                HabitusCardViewModel(id: 1,
//                                                   icon: "https://via.placeholder.com/150",
//                                                   date: "01/01/2023 00:00:00",
//                                                   name: "Estudar Bando de Dados",
//                                                  label: "horas",
//                                                  value: "2",
//                                                  state: .blue))

        }.frame(maxWidth:.infinity)
                .navigationTitle("Lista")
                
}
        .previewDevice ("")
        .preferredColorScheme($0)
    }
  }
}
